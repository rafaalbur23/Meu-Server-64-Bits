#include <iostream>
#include "GroupServerApp.h"
#include "GameCommon.h"

void GroupServerApp::PC_GULD_INIT(Player *ply)
{
	ply->m_CurrGuildNum = 0;
	if(ply->m_guild[ply->m_currcha] >0)
	{
		Guild *l_guild =FindGuildByGldID(ply->m_guild[ply->m_currcha]);
		if(l_guild)
		{
			ply->JoinGuild(l_guild);
			if(l_guild->m_leaderID ==ply->m_chaid[ply->m_currcha])
			{
				l_guild->m_leader	=ply;
				m_tblguilds->GetGuildMemberNum( l_guild->m_id, ply->m_CurrGuildNum );
			}
		}else
		{
			LogLine	l_line(g_LogGuild);
			//l_line<<newln<<"���["<<ply->m_chaname[ply->m_currcha]<<"]���߳�ʼ��ʱû�ҵ�����ṹ,����ID:"<<ply->m_guild[ply->m_currcha]<<endln;
			l_line<<newln<<"player ["<<ply->m_chaname[ply->m_currcha]<<"] can't get guild struct ,guild ID:"<<ply->m_guild[ply->m_currcha]<<endln;
		}
	}
	MutexArmor l_lockDB(m_mtxDB);
	m_tblguilds->InitGuildMember(ply,ply->m_chaid[ply->m_currcha],ply->m_guild[ply->m_currcha],0);
}
void GroupServerApp::MP_GUILD_CREATE(Player *ply,DataSocket *datasock,RPacket &pk)
{
	ply->m_guild[ply->m_currcha]=pk.ReadLong();
	Guild *l_gld				=FindGuildByGldID(ply->m_guild[ply->m_currcha]);
	l_gld->m_id					=ply->m_guild[ply->m_currcha];	//����ID
	//strcpy(l_gld->m_name, pk.ReadString());						//������
	strncpy_s(l_gld->m_name,sizeof(l_gld->m_name), pk.ReadString(),_TRUNCATE);						//������
	//strcpy(l_gld->m_motto,"");									//����������
	strncpy_s(l_gld->m_motto,sizeof(l_gld->m_motto),"",_TRUNCATE);									//����������
	l_gld->m_leaderID			=ply->m_chaid[ply->m_currcha];	//�᳤ID
	l_gld->m_type				=pk.ReadChar();					//��������
	l_gld->m_stat				=0;								//����״̬
	l_gld->m_remain_minute		=0;								//�����ɢʣ�������
	l_gld->m_tick				=GetTickCount();

	ply->JoinGuild(l_gld);
	WPacket	l_wpk	=g_gpsvr->GetWPacket();
	l_wpk.WriteCmd(CMD_PC_GUILD);
	l_wpk.WriteChar(MSG_GUILD_START);
	l_wpk.WriteLong(ply->m_guild[ply->m_currcha]);	//����ID
	l_wpk.WriteString(ply->GetGuild()->m_name);		//����name
	l_wpk.WriteLong(ply->GetGuild()->m_leaderID);	//�᳤ID

	l_wpk.WriteChar(1);									//online
	l_wpk.WriteLong(ply->m_chaid[ply->m_currcha]);		//chaid
	l_wpk.WriteString(ply->m_chaname[ply->m_currcha].c_str());	//chaname
	l_wpk.WriteString(ply->m_motto[ply->m_currcha].c_str());	//motto
	l_wpk.WriteString(pk.ReadString());					//job
	l_wpk.WriteShort(pk.ReadShort());					//degree
	l_wpk.WriteShort(ply->m_icon[ply->m_currcha]);		//icon
	l_wpk.WriteShort(0xFFFF);							//permission

	l_wpk.WriteLong(0);
	l_wpk.WriteChar(1);
	g_gpsvr->SendToClient(ply,l_wpk);
}
void GroupServerApp::MP_GUILD_APPROVE(Player *ply,DataSocket *datasock,RPacket &pk)
{
	uLong	l_chaid	=pk.ReadLong();
	Player	*l_ply	=FindPlayerByChaID(l_chaid);
	if(!ply->GetGuild())
	{
		LogLine	l_line(g_LogGuild);
		//l_line<<newln<<"GroupServer�ϵĹ��������쳣���뿪���߽��...";
		l_line<<newln<<"GroupServer guild data exception, please contact developer...";
		return;
	}
	if(l_ply)
	{
		l_ply->m_guild[l_ply->m_currcha]	=ply->GetGuild()->m_id;
		l_ply->JoinGuild(ply->GetGuild());
	}
	MutexArmor l_lockDB(m_mtxDB);
	m_tblguilds->InitGuildMember(l_ply,l_chaid,ply->GetGuild()->m_id,1);
	++(ply->m_CurrGuildNum);//Add by sunny.sun 20090611
}
void GroupServerApp::MP_GUILD_KICK(Player *ply,DataSocket *datasock,RPacket &pk)
{
	uLong	 l_chaid	=pk.ReadLong();
	Guild	*l_guild	=ply->GetGuild();
	if(!l_guild)
	{
		LogLine	l_line(g_LogGuild);
		//l_line<<newln<<"GroupServer�ϵĹ��������쳣���뿪���߽��...";
		l_line<<newln<<"GroupServer guild data exception, please contact developer...";
		return;
	}
	Player	*l_ply	=l_guild->FindGuildMemByChaID(l_chaid);

	if(l_ply && l_ply->m_currcha >=0)
	{
		l_ply->m_guild[l_ply->m_currcha]	=0;
		l_ply->LeaveGuild();

		WPacket	l_wpk	=GetWPacket();
		l_wpk.WriteCmd(CMD_PC_GUILD);
		l_wpk.WriteChar(MSG_GUILD_STOP);
		SendToClient(l_ply,l_wpk);
	}
	Player *l_plylst[10240];
	short	l_plynum	=0;

	WPacket	l_wpk	=GetWPacket();
	l_wpk.WriteCmd(CMD_PC_GUILD);
	l_wpk.WriteChar(MSG_GUILD_DEL);
	l_wpk.WriteLong(l_chaid);
	RunChainGetArmor<GuildMember> l(*l_guild);
	while(l_ply	=static_cast<Player	*>(l_guild->GetNextItem()))
	{
		l_plylst[l_plynum]	=l_ply;
		l_plynum	++;
	}
	l.unlock();

	SendToClient(l_plylst,l_plynum,l_wpk);
	--(ply->m_CurrGuildNum);//Add by sunny.sun 20090611
}
void GroupServerApp::MP_GUILD_LEAVE(Player *ply,DataSocket *datasock,RPacket &pk)
{
	uLong	 l_chaid	=ply->m_chaid[ply->m_currcha];
	Guild	*l_guild	=ply->GetGuild();
	if(!l_guild)
	{
		LogLine	l_line(g_LogGuild);
		//l_line<<newln<<"GroupServer�ϵĹ��������쳣���뿪���߽��...";
		l_line<<newln<<"GroupServer guild data exception, please contact developer...";
		return;
	}
	{
		ply->m_guild[ply->m_currcha]	=0;
		ply->LeaveGuild();

		WPacket	l_wpk	=GetWPacket();
		l_wpk.WriteCmd(CMD_PC_GUILD);
		l_wpk.WriteChar(MSG_GUILD_STOP);
		SendToClient(ply,l_wpk);
	}
	Player *l_plylst[10240];
	short	l_plynum	=0;

	WPacket	l_wpk	=GetWPacket();
	l_wpk.WriteCmd(CMD_PC_GUILD);
	l_wpk.WriteChar(MSG_GUILD_DEL);
	l_wpk.WriteLong(l_chaid);
	RunChainGetArmor<GuildMember> l(*l_guild);
	while(ply	=static_cast<Player	*>(l_guild->GetNextItem()))
	{
		l_plylst[l_plynum]	=ply;
		l_plynum	++;
	}
	l.unlock();

	SendToClient(l_plylst,l_plynum,l_wpk);
	--(ply->m_CurrGuildNum);//Add by sunny.sun 20090611
}
void GroupServerApp::MP_GUILD_DISBAND(Player *ply,DataSocket *datasock,RPacket &pk)
{
	Guild	*l_guild	=ply->GetGuild();
	if(!l_guild)
	{
		LogLine	l_line(g_LogGuild);
		//l_line<<newln<<"GroupServer�ϵĹ��������쳣���뿪���߽��...";
		l_line<<newln<<"GroupServer guild data exception, please contact developer...";
		return;
	}
	l_guild->m_leader	=0;
	l_guild->m_leaderID	=0;

	Player *l_plylst[10240];
	short	l_plynum	=0;

	WPacket	l_wpk	=GetWPacket();
	l_wpk.WriteCmd(CMD_PC_GUILD);
	l_wpk.WriteChar(MSG_GUILD_STOP);
	RunChainGetArmor<GuildMember> l(*l_guild);
	while(ply	=static_cast<Player	*>(l_guild->GetFirstItem()))
	{
		ply->m_guild[ply->m_currcha]	=0;
		ply->LeaveGuild();

		l_plylst[l_plynum]	=ply;
		l_plynum	++;
	}
	l.unlock();

	SendToClient(l_plylst,l_plynum,l_wpk);
	ply->m_CurrGuildNum = 0;//Add by sunny.sun 20090611
}
void GroupServerApp::MP_GUILD_MOTTO(Player *ply,DataSocket *datasock,RPacket &pk)
{
	Guild	*l_guild	=ply->GetGuild();
	if(!l_guild)
	{
		LogLine	l_line(g_LogGuild);
		//l_line<<newln<<"GroupServer�ϵĹ��������쳣���뿪���߽��...";
		l_line<<newln<<"GroupServer guild data exception, please contact developer...";
		return;
	}
	//strcpy(l_guild->m_motto,pk.ReadString());
	strncpy_s(l_guild->m_motto,sizeof(l_guild->m_motto),pk.ReadString(),_TRUNCATE);
}

void GroupServerApp::MP_GUILD_CHALLMONEY(Player *ply,DataSocket *datasock,RPacket &pk)
{
	DWORD dwChallID = pk.ReadLong();
	DWORD dwMoney  = pk.ReadLong();
	Guild* pGuild = FindGuildByGldID( dwChallID );
	if( !pGuild || pGuild->m_leaderID == 0 )
	{
		LogLine	l_line(g_LogGuild);
		//l_line<<newln<<"GroupServer�ϵĹ��������쳣��δ�ҵ�����,���߹���û�л᳤���˻���ս�����Ǯʧ�ܣ�guildid = "<<dwChallID<<"money = "<<dwMoney;
		l_line<<newln<<"GroupServer guild data exception, find guild nothing, or guild has no leader! withdrawal challenging money! guildid = "<<dwChallID<<"money = "<<dwMoney;
		return;
	}

	const char* pszGuild1 = pk.ReadString();
	const char* pszGuild2 = pk.ReadString();

	Player	*l_ply = pGuild->m_leader;
	if( !l_ply || l_ply->m_currcha == -1 || pGuild->m_leaderID != l_ply->m_chaid[l_ply->m_currcha] )
	{
		// ������,�������ݿ�
		LogLine	l_line(g_LogGuild);
		//l_line<<newln<<"��Ҳ�����ͨ�����ݿ�������˻���ս���ᡶ"<<pszGuild1<<"����Ǯ��chaid = "<<pGuild->m_leaderID<<"money = "<<dwMoney;
		l_line<<newln<<"player is offline, withdrawal challenging��"<<pszGuild1<<"��money!chaid = "<<pGuild->m_leaderID<<"money = "<<dwMoney;

		MutexArmor l_lockDB(g_gpsvr->m_mtxDB);
		if( !g_gpsvr->m_tblcharaters->AddMoney( pGuild->m_leaderID, dwMoney ) )
		{
			LogLine	l_line(g_LogGuild);
			//l_line<<newln<<"��ս���ᣬ�˻���ս���ᡶ"<<pszGuild1<<"����Ǯ���ݿ����ʧ�ܣ�chaid = "<<pGuild->m_leaderID<<"money = "<<dwMoney;
			l_line<<newln<<"challenge guild, withdrawal challenging��"<<pszGuild1<<"��money failed!chaid = "<<pGuild->m_leaderID<<"money = "<<dwMoney;
		}
	}
	else
	{
		// ������֪ͨ���ڷ�����
		LogLine	l_line(g_LogGuild);
		//l_line<<newln<<"����֪ͨ��ս���ᣬ�˻���ս���ᡶ"<<pszGuild1<<"����Ǯ��chaid = "<<pGuild->m_leaderID<<"money = "<<dwMoney;
		l_line<<newln<<"online guild, withdrawal challenging��"<<pszGuild1<<"��money!chaid = "<<pGuild->m_leaderID<<"money = "<<dwMoney;

		WPacket	l_wpk = GetWPacket();
		l_wpk.WriteCmd(CMD_PM_GUILD_CHALLMONEY);
		l_wpk.WriteLong( pGuild->m_leaderID );
		l_wpk.WriteLong( dwMoney );
		l_wpk.WriteString( pszGuild1 );
		l_wpk.WriteString( pszGuild2 );
		l_wpk.WriteShort( 0 );
		SendToClient( l_ply, l_wpk );
	}
}

void GroupServerApp::MP_GUILD_CHALL_PRIZEMONEY(Player *ply,DataSocket *datasock,RPacket &pk)
{
	DWORD dwChallID = pk.ReadLong();
	DWORD dwMoney  = pk.ReadLong();
	Guild* pGuild = FindGuildByGldID( dwChallID );
	if( !pGuild || pGuild->m_leaderID == 0 )
	{
		LogLine	l_line(g_LogGuild);
		//l_line<<newln<<"GroupServer�ϵĹ��������쳣��δ�ҵ�����,���߹���û�л᳤���˻���ս����ʤ������ʧ�ܣ�guildid = "<<dwChallID<<"money = "<<dwMoney;
		l_line<<newln<<"GroupServer guild data exception, can't find leader, or has no leader! withdrawal challenging money failed!guildid = "<<dwChallID<<"money = "<<dwMoney;
		return;
	}

	Player	*l_ply = pGuild->m_leader;
	if( !l_ply || l_ply->m_currcha == -1 || pGuild->m_leaderID != l_ply->m_chaid[l_ply->m_currcha] )
	{
		// ������,�������ݿ�
		LogLine	l_line(g_LogGuild);
		//l_line<<newln<<"��Ҳ�����ͨ�����ݿ�������˻���ս���ᡶ"<<pGuild->m_name<<"����Ǯ��chaid = "<<pGuild->m_leaderID<<"money = "<<dwMoney;
		l_line<<newln<<"player is offline, withdrawal challenging guild��"<<pGuild->m_name<<"��money! chaid = "<<pGuild->m_leaderID<<"money = "<<dwMoney;

		MutexArmor l_lockDB(g_gpsvr->m_mtxDB);
		if( !g_gpsvr->m_tblcharaters->AddMoney( pGuild->m_leaderID, dwMoney ) )
		{
			LogLine	l_line(g_LogGuild);
			//l_line<<newln<<"��ս���ᣬ�˻���ս���ᡶ"<<pGuild->m_name<<"��ʤ���������ݿ����ʧ�ܣ�chaid = "<<pGuild->m_leaderID<<"money = "<<dwMoney;
			l_line<<newln<<"challenging guild, withdrawal challenging guild��"<<pGuild->m_name<<"��money failed! chaid = "<<pGuild->m_leaderID<<"money = "<<dwMoney;
		}
	}
	else
	{
		LogLine	l_line(g_LogGuild);
		//l_line<<newln<<"����֪ͨ��ս���ᣬ�˻���ս���ᡶ"<<pGuild->m_name<<"��ʤ������chaid = "<<pGuild->m_leaderID<<"money = "<<dwMoney;
		l_line<<newln<<"online challenging guild, withdrawal challenging guild��"<<pGuild->m_name<<"��moeny!chaid = "<<pGuild->m_leaderID<<"money = "<<dwMoney;

		// ������֪ͨ���ڷ�����
		WPacket	l_wpk = GetWPacket();
		l_wpk.WriteCmd(CMD_PM_GUILD_CHALL_PRIZEMONEY);
		l_wpk.WriteLong( pGuild->m_leaderID );
		l_wpk.WriteLong( dwMoney );
		l_wpk.WriteShort( 0 );
		SendToClient( l_ply, l_wpk );
	}
}

void Player::GuildInvitedCheck(Invited	*invited)
{
	Player *l_inviter	=invited->m_ptinviter.m_ply;
	if(m_currcha<0)
	{
		GuildEndInvited(l_inviter);
	}else if(l_inviter->m_currcha <0 || l_inviter->m_chaid[l_inviter->m_currcha] !=invited->m_ptinviter.m_chaid)
	{
		WPacket l_wpk	=g_gpsvr->GetWPacket();
		l_wpk.WriteCmd(CMD_PC_GUILD_CANCEL);
		l_wpk.WriteChar(MSG_GUILD_CANCLE_OFFLINE);
		l_wpk.WriteLong(invited->m_ptinviter.m_chaid);
		g_gpsvr->SendToClient(this,l_wpk);
		GuildEndInvited(l_inviter);
	}else if( l_inviter->GetGuild()&& l_inviter->GetGuild()->GetTotal()	>=g_gpsvr->const_guild.GuildMemberMax)
	{
		WPacket l_wpk	=g_gpsvr->GetWPacket();
		l_wpk.WriteCmd(CMD_PC_GUILD_CANCEL);
		l_wpk.WriteChar(MSG_GUILD_CANCLE_SELF_ISFULL);
		l_wpk.WriteLong(invited->m_ptinviter.m_chaid);
		g_gpsvr->SendToClient(this,l_wpk);
		GuildEndInvited(l_inviter);
	}else if(l_inviter->GetGuild() && l_inviter->GetGuild()->m_leaderID != l_inviter->m_chaid[l_inviter->m_currcha])
	{
		WPacket l_wpk	=g_gpsvr->GetWPacket();
		l_wpk.WriteCmd(CMD_PC_GUILD_CANCEL);
		l_wpk.WriteChar(MSG_GUILD_CANCLE_SELFCANCEL);
		l_wpk.WriteLong(invited->m_ptinviter.m_chaid);
		g_gpsvr->SendToClient(this,l_wpk);
		GuildEndInvited(l_inviter);
	}else if( GetGuild() && GetGuild()->GetTotal()>1 )
	{
		char l_buf[256];
		//sprintf(l_buf,"������ġ�%s���Ѿ������˱����ӣ�������뱻ȡ����",m_chaname[m_currcha].c_str());
		//sprintf(l_buf,RES_STRING(GP_GROUPSERVERAPPTEAM_CPP_00028),m_chaname[m_currcha].c_str());
		_snprintf_s(l_buf,sizeof(l_buf),_TRUNCATE,RES_STRING(GP_GROUPSERVERAPPGUILD_CPP_00008),m_chaname[m_currcha].c_str());
		l_inviter->SendSysInfo(l_buf);

		WPacket l_wpk	=g_gpsvr->GetWPacket();
		l_wpk.WriteCmd(CMD_PC_GUILD_CANCEL);
		l_wpk.WriteChar(MSG_GUILD_CANCLE_CANCEL);
		l_wpk.WriteLong(invited->m_ptinviter.m_chaid);
		g_gpsvr->SendToClient(this,l_wpk);
		GuildEndInvited(l_inviter);
	}else if(g_gpsvr->GetCurrentTick() -invited->m_tick	>=g_gpsvr->const_guild.PendTimeOut)
	{
		char l_buf[256];
		//sprintf(l_buf,"��ԡ�%s������������ѳ���%d����û�л�Ӧ��ϵͳ�Զ�ȡ����������롣",m_chaname[m_currcha].c_str(),g_gpsvr->const_team.PendTimeOut/1000);
		//sprintf(l_buf,RES_STRING(GP_GROUPSERVERAPPTEAM_CPP_00029),m_chaname[m_currcha].c_str(),g_gpsvr->const_team.PendTimeOut/1000);
		//_snprintf_s(l_buf,sizeof(l_buf),_TRUNCATE,RES_STRING(GP_GROUPSERVERAPPTEAM_CPP_00029),m_chaname[m_currcha].c_str(),g_gpsvr->const_team.PendTimeOut/1000);
		CFormatParameter param(2);
		param.setString( 0, m_chaname[m_currcha].c_str() );
		param.setLong( 1, g_gpsvr->const_guild.PendTimeOut/1000 );
		RES_FORMAT_STRING( GP_GROUPSERVERAPPGUILD_CPP_00009, param, l_buf );
		l_inviter->SendSysInfo(l_buf);

		WPacket l_wpk	=g_gpsvr->GetWPacket();
		l_wpk.WriteCmd(CMD_PC_GUILD_CANCEL);
		l_wpk.WriteChar(MSG_GUILD_CANCLE_TIMEOUT);
		l_wpk.WriteLong(invited->m_ptinviter.m_chaid);
		g_gpsvr->SendToClient(this,l_wpk);
		GuildEndInvited(l_inviter);
	}
}
//Add by sunny.sun 20090605 for Guild invite
void GroupServerApp::CP_GUILD_INVITE(Player *ply,DataSocket *datasock,RPacket &pk)
{
	if(ply->m_CurrGuildNum >=const_guild.GuildMemberMax)
	{
		//ply->SendSysInfo("���Ĺ����Ա���Ѿ��ﵽ����������ˣ��������뱻ȡ����");
		ply->SendSysInfo(RES_STRING(GP_GROUPSERVERAPPGUILD_CPP_00001));
	}
	else
	{
		Invited				*	l_invited	=0;
		uShort				l_len;
		cChar			*	l_invited_name	=pk.ReadString(&l_len);
		if(!l_invited_name || l_len >16)
		{
			return;
		}
		Player			*	l_invited_ply	=FindPlayerByChaName(l_invited_name);
		if(!l_invited_ply || l_invited_ply->m_currcha <0 || l_invited_ply ==ply)
		{
			char l_buf[256];
			//sprintf(l_buf,"�����������ҡ�%s����ǰ�������ϡ�",l_invited_name);
			_snprintf_s(l_buf,sizeof(l_buf),_TRUNCATE,RES_STRING(GP_GROUPSERVERAPPGUILD_CPP_00002),l_invited_name);
			ply->SendSysInfo(l_buf);
		}else if(l_invited =l_invited_ply->GuildFindInvitedByInviterChaID(ply->m_chaid[ply->m_currcha]))
		{
			//ply->SendSysInfo(dstring("����ǰ�ԡ�")<<l_invited_name<<"���Ѿ���һ��δ���Ĺ������룬���԰����ꡣ");
			char l_buf[256];
			_snprintf_s(l_buf,sizeof(l_buf),_TRUNCATE,RES_STRING(GP_GROUPSERVERAPPGUILD_CPP_00003),l_invited_name);
			ply->SendSysInfo(l_buf);
		}else if( !ply->GetGuild() || (ply->m_chaid[ply->m_currcha] != ply->GetGuild()->m_leaderID ))
		{
			char l_buf[256];
			//sprintf(l_buf,"ֻ�л᳤���ܷ����������롣",l_invited_name);
			_snprintf_s(l_buf,sizeof(l_buf),_TRUNCATE,RES_STRING(GP_GROUPSERVERAPPGUILD_CPP_00004),ply->m_chaname[ply->m_currcha].c_str());
			ply->SendSysInfo(l_buf);			
		}else if( l_invited_ply->GetGuild() && l_invited_ply->m_guild[l_invited_ply->m_chaid[l_invited_ply->m_currcha]] > 0 )
		{
			char l_buf[256];
			//sprintf(l_buf,"������й���",l_invited_name);
			_snprintf_s(l_buf,sizeof(l_buf),_TRUNCATE,RES_STRING(GP_GROUPSERVERAPPGUILD_CPP_00005),ply->m_chaname[ply->m_currcha].c_str());
			ply->SendSysInfo(l_buf);					
		}
		else
		{
			PtInviter l_ptinviter	=l_invited_ply->GuildBeginInvited(ply);
			if(l_ptinviter )
			{
				char l_buf[256];
				//sprintf(l_buf,"��������ĺ�����ҡ�%s�����ڱ������������ڷ�æ״̬,�����������ѱ�ϵͳȡ����",l_invited_name);
				_snprintf_s(l_buf,sizeof(l_buf),_TRUNCATE,RES_STRING(GP_GROUPSERVERAPPGUILD_CPP_00006),l_invited_name);
				l_ptinviter->SendSysInfo(l_buf);

				WPacket	l_wpk	=GetWPacket();
				l_wpk.WriteCmd(CMD_PC_GUILD_CANCEL);
				l_wpk.WriteChar(MSG_GUILD_CANCLE_BUSY);
				l_wpk.WriteLong(l_ptinviter.m_chaid);
				SendToClient(l_invited_ply,l_wpk);
			}
			WPacket	l_wpk	=GetWPacket();
			l_wpk.WriteCmd(CMD_PC_GUILD_INVITE);
			l_wpk.WriteString(ply->m_chaname[ply->m_currcha].c_str());
			l_wpk.WriteLong(ply->m_chaid[ply->m_currcha]);
			l_wpk.WriteShort(ply->m_icon[ply->m_currcha]);
			SendToClient(l_invited_ply,l_wpk);			
		}
	}
}
void GroupServerApp::CP_GUILD_REFUSE(Player *ply,DataSocket *datasock,RPacket &pk)
{
	uLong		l_inviter_chaid	=pk.ReadLong();
	PtInviter	l_inviter		=ply->GuildEndInvited(l_inviter_chaid);
	if(l_inviter && l_inviter->m_currcha >=0 && l_inviter.m_chaid ==l_inviter->m_chaid[l_inviter->m_currcha])
	{
		char l_buf[256];
		//sprintf(l_buf,"��ҡ�%s���ܾ������Ĺ������롣",ply->m_chaname[ply->m_currcha].c_str());
		_snprintf_s(l_buf,sizeof(l_buf),_TRUNCATE,RES_STRING(GP_GROUPSERVERAPPGUILD_CPP_00007),ply->m_chaname[ply->m_currcha].c_str());
		l_inviter->SendSysInfo(l_buf);
	}
}
void GroupServerApp::CP_GUILD_ACCEPT(Player *ply,DataSocket *datasock,RPacket &pk)
{
	uLong		l_inviter_chaid	=pk.ReadLong();
	PtInviter	l_inviter		=ply->GuildEndInvited(l_inviter_chaid);
	if(l_inviter && l_inviter->m_currcha >=0 && l_inviter.m_chaid ==l_inviter->m_chaid[l_inviter->m_currcha])
	{
		LogLine	l_line(g_LogGuild);
		l_line<<newln<<"player"<<ply->m_chaname[ply->m_currcha]<<"("<<ply->m_chaid[ply->m_currcha]
		<<")and player"<<l_inviter->m_chaname[l_inviter->m_currcha]<<"("<<l_inviter_chaid<<") make same guild"
			<<endln;

		WPacket	l_wpk =GetWPacket();
		l_wpk.WriteCmd( CMD_PM_GUILD_INVITE );
		l_wpk.WriteLong( ply->m_chaid[ply->m_currcha] );
		l_wpk.WriteLong( l_inviter->m_chaid[l_inviter->m_currcha]);
		SendToClient(ply,l_wpk);
	}
}
