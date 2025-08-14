--------------------------------------------------------------------------
--									--
--									--
--				AttrType.lua 				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading AttrType.lua" )


ATTR_COUNT_BASE0    = 0;
ATTR_LV             = ATTR_COUNT_BASE0 + 0; 		-- char level (grading role)
ATTR_HP             = ATTR_COUNT_BASE0 + 1; 		-- the current HP (for vessels that durable) 
ATTR_SP             = ATTR_COUNT_BASE0 + 2; 		-- the current SP (the vessels that supply) 
ATTR_TITLE          = ATTR_COUNT_BASE0 + 3; 		-- the title role 
ATTR_JOB            = ATTR_COUNT_BASE0 + 4; 		-- professional role 
ATTR_FAME           = ATTR_COUNT_BASE0 + 5; 		-- reputation 
ATTR_AP             = ATTR_COUNT_BASE0 + 6; 		-- Attribute points 
ATTR_TP             = ATTR_COUNT_BASE0 + 7; 		-- skills point 
ATTR_GD             = ATTR_COUNT_BASE0 + 8; 		-- money
ATTR_SPRI           = ATTR_COUNT_BASE0 + 9; 		-- artillery shells flying speed 
ATTR_CHATYPE        = ATTR_COUNT_BASE0 + 10; 		-- role in the type of control (players, NPC, monsters, etc.) 
ATTR_SAILLV         = ATTR_COUNT_BASE0 + 11; 		-- marine grade
ATTR_LIFELV         = ATTR_COUNT_BASE0 + 12; 		-- class life
ATTR_LIFETP         = ATTR_COUNT_BASE0 + 13; 		-- life skills points 
ATTR_BOAT_BERTH     = ATTR_COUNT_BASE0 + 14; 		-- berthing port

-- The following attributes within the scope of the order irrevocable 
ATTR_CEXP           = ATTR_COUNT_BASE0 + 15; 		-- the current experience (for vessels that Shouliandu) 
ATTR_NLEXP          = ATTR_COUNT_BASE0 + 16; 		-- an experience required 
ATTR_CLEXP          = ATTR_COUNT_BASE0 + 17; 		-- the current level of experience 
ATTR_CLEFT_SAILEXP  = ATTR_COUNT_BASE0 + 18; 		-- the remaining sailing experience 
ATTR_CSAILEXP       = ATTR_COUNT_BASE0 + 19; 		-- accumulated sailing experience (current sailing experience) 
ATTR_CLV_SAILEXP    = ATTR_COUNT_BASE0 + 20; 		-- the current class sailing experience 
ATTR_NLV_SAILEXP    = ATTR_COUNT_BASE0 + 21; 		-- the next grade class sailing experience 
ATTR_CLIFEEXP       = ATTR_COUNT_BASE0 + 22; 		-- the life experience 
ATTR_CLV_LIFEEXP    = ATTR_COUNT_BASE0 + 23; 		-- the current grading life experience 
ATTR_NLV_LIFEEXP    = ATTR_COUNT_BASE0 + 24; 		-- the next grade life experience 
--

ATTR_COUNT_BASE1    = 25;
ATTR_STR            = ATTR_COUNT_BASE1 + 0; 		-- force
ATTR_DEX            = ATTR_COUNT_BASE1 + 1; 		-- Focus on 
ATTR_AGI            = ATTR_COUNT_BASE1 + 2; 		-- Agile
ATTR_CON            = ATTR_COUNT_BASE1 + 3; 		-- Physique
ATTR_STA            = ATTR_COUNT_BASE1 + 4; 		-- energy
ATTR_LUK            = ATTR_COUNT_BASE1 + 5; 		-- lucky
ATTR_MXHP           = ATTR_COUNT_BASE1 + 6; 		-- the largest HP 
ATTR_MXSP           = ATTR_COUNT_BASE1 + 7; 		-- the largest SP 
ATTR_MNATK          = ATTR_COUNT_BASE1 + 8; 		-- Cuoxiaogongjili
ATTR_MXATK          = ATTR_COUNT_BASE1 + 9; 		-- the largest attack of
ATTR_DEF            = ATTR_COUNT_BASE1 + 10; 		-- defense force
ATTR_HIT            = ATTR_COUNT_BASE1 + 11; 		-- shooting
ATTR_FLEE           = ATTR_COUNT_BASE1 + 12; 		-- Ducking rate
ATTR_MF             = ATTR_COUNT_BASE1 + 13; 		-- opening rate 
ATTR_CRT            = ATTR_COUNT_BASE1 + 14; 		-- unexploded strike rate
ATTR_HREC           = ATTR_COUNT_BASE1 + 15; 		-- hp speed of recovery
ATTR_SREC           = ATTR_COUNT_BASE1 + 16; 		-- sp speed of recovery 
ATTR_ASPD           = ATTR_COUNT_BASE1 + 17; 		-- attacks interval 
ATTR_ADIS           = ATTR_COUNT_BASE1 + 18; 		-- the range of attack 
ATTR_MSPD           = ATTR_COUNT_BASE1 + 19; 		-- Mobile speed
ATTR_COL            = ATTR_COUNT_BASE1 + 20; 		-- resource acquisition speed
ATTR_PDEF           = ATTR_COUNT_BASE1 + 21; 		-- physical resistance
ATTR_BOAT_CRANGE    = ATTR_COUNT_BASE1 + 22; 		-- vessels of the shells exploded 
ATTR_BOAT_CSPD      = ATTR_COUNT_BASE1 + 23; 		-- artillery shells flying speed vessels
ATTR_BOAT_PRICE     = ATTR_COUNT_BASE1 + 24; 		-- the value of vessels 

ATTR_COUNT_BASE2    = 50;
ATTR_BSTR           = ATTR_COUNT_BASE2 + 0; 		-- basic strength --- STR
ATTR_BDEX           = ATTR_COUNT_BASE2 + 1; 		-- basic focus --- ACC 
ATTR_BAGI           = ATTR_COUNT_BASE2 + 2; 		-- basic Agile --- AGI
ATTR_BCON           = ATTR_COUNT_BASE2 + 3; 		-- basic physical --- CON
ATTR_BSTA           = ATTR_COUNT_BASE2 + 4; 		-- basic energy --- SPR
ATTR_BLUK           = ATTR_COUNT_BASE2 + 5; 		-- basic fortunate --- luck
ATTR_BMXHP          = ATTR_COUNT_BASE2 + 6; 		-- basic largest HP
ATTR_BMXSP          = ATTR_COUNT_BASE2 + 7; 		-- the largest basic SP
ATTR_BMNATK         = ATTR_COUNT_BASE2 + 8; 		-- basic Cuoxiaogongjili
ATTR_BMXATK         = ATTR_COUNT_BASE2 + 9; 		-- the largest attack of the basic
ATTR_BDEF           = ATTR_COUNT_BASE2 + 10; 		-- basic defense force
ATTR_BHIT           = ATTR_COUNT_BASE2 + 11; 		-- basic shooting
ATTR_BFLEE          = ATTR_COUNT_BASE2 + 12; 		-- evade the basic rate
ATTR_BMF            = ATTR_COUNT_BASE2 + 13; 		-- basic rate treasure hunt
ATTR_BCRT           = ATTR_COUNT_BASE2 + 14; 		-- basic explosive strike rate
ATTR_BHREC          = ATTR_COUNT_BASE2 + 15; 		-- basic hp speed of recovery 
ATTR_BSREC          = ATTR_COUNT_BASE2 + 16; 		-- basic (sp role in the speed of recovery) (vessels consumption rate) 
ATTR_BASPD          = ATTR_COUNT_BASE2 + 17; 		-- basic attacks interval 
ATTR_BADIS          = ATTR_COUNT_BASE2 + 18; 		-- Basic range of attack 
ATTR_BMSPD          = ATTR_COUNT_BASE2 + 19; 		-- basic mobile speed
ATTR_BCOL           = ATTR_COUNT_BASE2 + 20; 		-- basic resource acquisition speed
ATTR_BPDEF          = ATTR_COUNT_BASE2 + 21; 		-- basic physical resistance 
ATTR_BOAT_BCRANGE   = ATTR_COUNT_BASE2 + 22; 		-- basic vessels explosion of shells
ATTR_BOAT_BCSPD     = ATTR_COUNT_BASE2 + 23; 		-- basic shells flying speed vessels 

ATTR_COUNT_BASE3    = 74;
ATTR_ITEMC_STR      = ATTR_COUNT_BASE3 + 0; 		-- forces props coefficient (item coefficient) Addition 
ATTR_ITEMC_AGI      = ATTR_COUNT_BASE3 + 1; 		-- Agile props coefficient Addition 
ATTR_ITEMC_DEX      = ATTR_COUNT_BASE3 + 2; 		-- Focus on props coefficient Addition
ATTR_ITEMC_CON      = ATTR_COUNT_BASE3 + 3; 		-- physical props coefficient Addition
ATTR_ITEMC_STA      = ATTR_COUNT_BASE3 + 4; 		-- props energy coefficient Addition
ATTR_ITEMC_LUK      = ATTR_COUNT_BASE3 + 5; 		-- lucky props coefficient Addition 
ATTR_ITEMC_ASPD     = ATTR_COUNT_BASE3 + 6; 		-- attacks interval props coefficient Addition 
ATTR_ITEMC_ADIS     = ATTR_COUNT_BASE3 + 7; 		-- attack from the props coefficient Addition 
ATTR_ITEMC_MNATK    = ATTR_COUNT_BASE3 + 8; 		-- Cuoxiaogongjili props coefficient Addition
ATTR_ITEMC_MXATK    = ATTR_COUNT_BASE3 + 9; 		-- the largest attack of props coefficient Addition
ATTR_ITEMC_DEF      = ATTR_COUNT_BASE3 + 10; 		-- defense of props coefficient Addition 
ATTR_ITEMC_MXHP     = ATTR_COUNT_BASE3 + 11; 		-- the largest HP props coefficient Addition
ATTR_ITEMC_MXSP     = ATTR_COUNT_BASE3 + 12; 		-- the largest coefficient SP props Addition
ATTR_ITEMC_FLEE     = ATTR_COUNT_BASE3 + 13; 		-- Ducking rate coefficient props Addition
ATTR_ITEMC_HIT      = ATTR_COUNT_BASE3 + 14; 		-- hit rate coefficient props Addition 
ATTR_ITEMC_CRT      = ATTR_COUNT_BASE3 + 15; 		-- props explosion hit rate coefficient Addition
ATTR_ITEMC_MF       = ATTR_COUNT_BASE3 + 16; 		-- treasure hunting props rate coefficient Addition
ATTR_ITEMC_HREC     = ATTR_COUNT_BASE3 + 17; 		-- hp speed of recovery coefficient props Addition
ATTR_ITEMC_SREC     = ATTR_COUNT_BASE3 + 18; 		-- sp speed of recovery coefficient props Addition
ATTR_ITEMC_MSPD     = ATTR_COUNT_BASE3 + 19; 		-- Mobile speed props coefficient Addition 
ATTR_ITEMC_COL      = ATTR_COUNT_BASE3 + 20; 		-- props resources acquisition speed coefficient Addition
ATTR_ITEMC_PDEF     = ATTR_COUNT_BASE3 + 21; 		-- physical resistance coefficient props Addition 

ATTR_COUNT_BASE4    = 96;
ATTR_ITEMV_STR      = ATTR_COUNT_BASE4 + 0; 		-- numerical strength props (item value) Addition 
ATTR_ITEMV_AGI      = ATTR_COUNT_BASE4 + 1; 		-- Agile props numerical Addition 
ATTR_ITEMV_DEX      = ATTR_COUNT_BASE4 + 2; 		-- Focus on props numerical Addition 
ATTR_ITEMV_CON      = ATTR_COUNT_BASE4 + 3; 		-- Numerical physical props Addition
ATTR_ITEMV_STA      = ATTR_COUNT_BASE4 + 4; 		-- Numerical energy props Addition
ATTR_ITEMV_LUK      = ATTR_COUNT_BASE4 + 5; 		-- lucky props numerical Addition
ATTR_ITEMV_ASPD     = ATTR_COUNT_BASE4 + 6; 		-- Addition attack numerical interval props
ATTR_ITEMV_ADIS     = ATTR_COUNT_BASE4 + 7; 		-- props numerical range of attack Addition 
ATTR_ITEMV_MNATK    = ATTR_COUNT_BASE4 + 8; 		-- Cuoxiaogongjili props numerical Addition
ATTR_ITEMV_MXATK    = ATTR_COUNT_BASE4 + 9; 		-- the largest attack of props numerical Addition
ATTR_ITEMV_DEF      = ATTR_COUNT_BASE4 + 10; 		-- defense of props numerical Addition 
ATTR_ITEMV_MXHP     = ATTR_COUNT_BASE4 + 11; 		-- the largest numerical HP props Addition 
ATTR_ITEMV_MXSP     = ATTR_COUNT_BASE4 + 12; 		-- the largest numerical SP props Addition 
ATTR_ITEMV_FLEE     = ATTR_COUNT_BASE4 + 13; 		-- Ducking rate props numerical Addition
ATTR_ITEMV_HIT      = ATTR_COUNT_BASE4 + 14; 		-- Numerical shot props Addition
ATTR_ITEMV_CRT      = ATTR_COUNT_BASE4 + 15; 		-- Numerical explosion hit rate props Addition
ATTR_ITEMV_MF       = ATTR_COUNT_BASE4 + 16; 		-- treasure of props numerical Addition 
ATTR_ITEMV_HREC     = ATTR_COUNT_BASE4 + 17; 		-- hp speed of recovery props numerical Addition
ATTR_ITEMV_SREC     = ATTR_COUNT_BASE4 + 18; 		-- sp speed of recovery props numerical Addition
ATTR_ITEMV_MSPD     = ATTR_COUNT_BASE4 + 19; 		-- Mobile speed props numerical Addition
ATTR_ITEMV_COL      = ATTR_COUNT_BASE4 + 20; 		-- Numerical resources acquisition speed props Addition
ATTR_ITEMV_PDEF     = ATTR_COUNT_BASE4 + 21; 		-- Numerical physical resistance props Addition

ATTR_COUNT_BASE5    = 118;
ATTR_STATEC_STR     = ATTR_COUNT_BASE5 + 0; 		-- state power coefficient (state coefficient) Addition
ATTR_STATEC_AGI     = ATTR_COUNT_BASE5 + 1; 		-- Agile state coefficient Addition
ATTR_STATEC_DEX     = ATTR_COUNT_BASE5 + 2; 		-- Focus on the state coefficient Addition 
ATTR_STATEC_CON     = ATTR_COUNT_BASE5 + 3; 		-- physical state coefficient Addition 
ATTR_STATEC_STA     = ATTR_COUNT_BASE5 + 4; 		-- state energy coefficient Addition 
ATTR_STATEC_LUK     = ATTR_COUNT_BASE5 + 5; 		-- lucky state coefficient Addition 
ATTR_STATEC_ASPD    = ATTR_COUNT_BASE5 + 6; 		-- attacks interval state coefficient Addition
ATTR_STATEC_ADIS    = ATTR_COUNT_BASE5 + 7; 		-- attack from the state coefficient Addition
ATTR_STATEC_MNATK   = ATTR_COUNT_BASE5 + 8; 		-- Cuoxiaogongjili state coefficient Addition 
ATTR_STATEC_MXATK   = ATTR_COUNT_BASE5 + 9; 		-- the largest of the state coefficient attack Addition
ATTR_STATEC_DEF     = ATTR_COUNT_BASE5 + 10; 		-- defense of the state coefficient Addition
ATTR_STATEC_MXHP    = ATTR_COUNT_BASE5 + 11; 		-- HP's largest state coefficient Addition
ATTR_STATEC_MXSP    = ATTR_COUNT_BASE5 + 12; 		-- the largest state coefficient SP Addition
ATTR_STATEC_FLEE    = ATTR_COUNT_BASE5 + 13; 		-- evade the state rate coefficient Addition
ATTR_STATEC_HIT     = ATTR_COUNT_BASE5 + 14; 		-- the state hit rate coefficient Addition
ATTR_STATEC_CRT     = ATTR_COUNT_BASE5 + 15; 		-- unexploded strike rate coefficient state Addition
ATTR_STATEC_MF      = ATTR_COUNT_BASE5 + 16; 		-- treasure state rate coefficient Addition 
ATTR_STATEC_HREC    = ATTR_COUNT_BASE5 + 17; 		-- hp speed of recovery coefficient state Addition 
ATTR_STATEC_SREC    = ATTR_COUNT_BASE5 + 18; 		-- sp speed of recovery coefficient state Addition
ATTR_STATEC_MSPD    = ATTR_COUNT_BASE5 + 19; 		-- Mobile speed coefficient state Addition 
ATTR_STATEC_COL     = ATTR_COUNT_BASE5 + 20; 		-- state resources acquisition speed coefficient Addition
ATTR_STATEC_PDEF    = ATTR_COUNT_BASE5 + 21; 		-- physical resistance coefficient Addition

ATTR_COUNT_BASE6    = 140;
ATTR_STATEV_STR     = ATTR_COUNT_BASE6 + 0; 		-- numerical strength of the state (state value) Addition 
ATTR_STATEV_AGI     = ATTR_COUNT_BASE6 + 1; 		-- Agile state numerical Addition
ATTR_STATEV_DEX     = ATTR_COUNT_BASE6 + 2; 		-- Focus on numerical state Addition
ATTR_STATEV_CON     = ATTR_COUNT_BASE6 + 3; 		-- Numerical physical state Addition 
ATTR_STATEV_STA     = ATTR_COUNT_BASE6 + 4; 		-- Numerical state energy Addition
ATTR_STATEV_LUK     = ATTR_COUNT_BASE6 + 5; 		-- lucky numerical state Addition 
ATTR_STATEV_ASPD    = ATTR_COUNT_BASE6 + 6; 		-- attacks numerical interval state Addition 
ATTR_STATEV_ADIS    = ATTR_COUNT_BASE6 + 7; 		-- attack from the state of numerical Addition 
ATTR_STATEV_MNATK   = ATTR_COUNT_BASE6 + 8; 		-- Numerical Cuoxiaogongjili state Addition 
ATTR_STATEV_MXATK   = ATTR_COUNT_BASE6 + 9; 		-- of the state's largest numerical attacks Addition
ATTR_STATEV_DEF     = ATTR_COUNT_BASE6 + 10; 		-- defense of the state of numerical Addition 
ATTR_STATEV_MXHP    = ATTR_COUNT_BASE6 + 11; 		-- the state's largest numerical HP Addition 
ATTR_STATEV_MXSP    = ATTR_COUNT_BASE6 + 12; 		-- the largest numerical SP state Addition 
ATTR_STATEV_FLEE    = ATTR_COUNT_BASE6 + 13; 		-- evade the state rate of numerical Addition
ATTR_STATEV_HIT     = ATTR_COUNT_BASE6 + 14; 		-- Numerical state hit rate Addition 
ATTR_STATEV_CRT     = ATTR_COUNT_BASE6 + 15; 		-- unexploded strike rate of state numerical Addition 
ATTR_STATEV_MF      = ATTR_COUNT_BASE6 + 16; 		-- treasure of state numerical Addition 
ATTR_STATEV_HREC    = ATTR_COUNT_BASE6 + 17; 		-- hp restoration of state numerical speed Addition 
ATTR_STATEV_SREC    = ATTR_COUNT_BASE6 + 18; 		-- sp resume speed numerical state Addition 
ATTR_STATEV_MSPD    = ATTR_COUNT_BASE6 + 19; 		-- Mobile speed numerical state Addition 
ATTR_STATEV_COL     = ATTR_COUNT_BASE6 + 20; 		-- state resources acquisition speed numerical Addition
ATTR_STATEV_PDEF    = ATTR_COUNT_BASE6 + 21; 		-- physical resistance numerical Addition 

ATTR_LHAND_ITEMV    = ATTR_COUNT_BASE6 + 22; 		-- left props Addition

ATTR_COUNT_BASE7        = 163;
ATTR_BOAT_SHIP          = ATTR_COUNT_BASE7 + 0; 	-- vessels ID 
ATTR_BOAT_HEADER        = ATTR_COUNT_BASE7 + 1; 	-- the bow type 
ATTR_BOAT_BODY          = ATTR_COUNT_BASE7 + 2; 	-- type hull 
ATTR_BOAT_ENGINE        = ATTR_COUNT_BASE7 + 3; 	-- type boat engine 
ATTR_BOAT_CANNON        = ATTR_COUNT_BASE7 + 4; 	-- artillery types of vessels 
ATTR_BOAT_PART          = ATTR_COUNT_BASE7 + 5; 	-- type boat accessories 
ATTR_BOAT_DBID          = ATTR_COUNT_BASE7 + 6; 	-- ID database storage vessel 
ATTR_BOAT_DIECOUNT      = ATTR_COUNT_BASE7 + 7; 	-- the ship death count
ATTR_BOAT_ISDEAD	= ATTR_COUNT_BASE7 + 8; 	-- whether the vessel is dead 

ATTR_COUNT_BASE8        = 172;
ATTR_BOAT_SKILLC_MNATK  = ATTR_COUNT_BASE8 + 0; 	-- skills coefficient affected vessels MNATK 
ATTR_BOAT_SKILLC_MXATK  = ATTR_COUNT_BASE8 + 1; 	-- skills coefficient affected vessels MXATK
ATTR_BOAT_SKILLC_ADIS   = ATTR_COUNT_BASE8 + 2; 	-- ships range of attack atkrange skills coefficient impact
ATTR_BOAT_SKILLC_MSPD   = ATTR_COUNT_BASE8 + 3; 	-- speed vessels skills coefficient impact
ATTR_BOAT_SKILLC_CSPD   = ATTR_COUNT_BASE8 + 4; 	-- artillery shells at a speed factor affecting skills
ATTR_BOAT_SKILLC_ASPD   = ATTR_COUNT_BASE8 + 5; 	-- skills coefficient affected vessels ASPD 
ATTR_BOAT_SKILLC_CRANGE = ATTR_COUNT_BASE8 + 6; 	-- artillery shells exploded factor affecting the scope of skills 
ATTR_BOAT_SKILLC_DEF    = ATTR_COUNT_BASE8 + 7; 	-- factors affecting vessels DEF skills 
ATTR_BOAT_SKILLC_RESIST = ATTR_COUNT_BASE8 + 8; 	-- skills coefficient affected vessels RESIST 
ATTR_BOAT_SKILLC_MXUSE  = ATTR_COUNT_BASE8 + 9; 	-- the largest vessels durable impact coefficient skills
ATTR_BOAT_SKILLC_USEREC = ATTR_COUNT_BASE8 + 10; 	-- speed vessels restore durable impact coefficient skills
ATTR_BOAT_SKILLC_EXP    = ATTR_COUNT_BASE8 + 11; 	-- skills vessels consumption rate coefficient impact
ATTR_BOAT_SKILLC_CPT    = ATTR_COUNT_BASE8 + 12; 	-- Chuancang capacity factor affecting skills
ATTR_BOAT_SKILLC_SPD    = ATTR_COUNT_BASE8 + 13; 	-- speed skills coefficient impact
ATTR_BOAT_SKILLC_MXSPLY = ATTR_COUNT_BASE8 + 14; 	-- the biggest factor affecting supply of skills

ATTR_COUNT_BASE9        = 187;
ATTR_BOAT_SKILLV_MNATK  = ATTR_COUNT_BASE9 + 0; 	-- vessels MNATK skills constant impact 
ATTR_BOAT_SKILLV_MXATK  = ATTR_COUNT_BASE9 + 1; 	-- vessels MXATK skills constant impact
ATTR_BOAT_SKILLV_ADIS   = ATTR_COUNT_BASE9 + 2; 	-- vessels skills constant attack from the impact atkrange
ATTR_BOAT_SKILLV_MSPD   = ATTR_COUNT_BASE9 + 3; 	-- skills constant speed vessels impact
ATTR_BOAT_SKILLV_CSPD   = ATTR_COUNT_BASE9 + 4; 	-- artillery shells flying skills constant velocity impact
ATTR_BOAT_SKILLV_ASPD   = ATTR_COUNT_BASE9 + 5; 	-- vessels ASPD skills constant impact
ATTR_BOAT_SKILLV_CRANGE = ATTR_COUNT_BASE9 + 6; 	-- artillery shells exploded constant impact of the skills 
ATTR_BOAT_SKILLV_DEF    = ATTR_COUNT_BASE9 + 7; 	-- vessels DEF skills constant impact
ATTR_BOAT_SKILLV_RESIST = ATTR_COUNT_BASE9 + 8; 	-- vessels RESIST skills constant impact 
ATTR_BOAT_SKILLV_MXUSE  = ATTR_COUNT_BASE9 + 9; 	-- the largest vessels durable skills constant impact 
ATTR_BOAT_SKILLV_USEREC = ATTR_COUNT_BASE9 + 10; 	-- durable vessels return skills constant speed impact 
ATTR_BOAT_SKILLV_EXP    = ATTR_COUNT_BASE9 + 11; 	-- vessels consumption rate constant influence skills 
ATTR_BOAT_SKILLV_CPT    = ATTR_COUNT_BASE9 + 12; 	-- Chuancang capacity skills constant impact 
ATTR_BOAT_SKILLV_SPD    = ATTR_COUNT_BASE9 + 13; 	-- skills constant speed impact
ATTR_BOAT_SKILLV_MXSPLY = ATTR_COUNT_BASE9 + 14; 	-- the biggest impact of constant supply of skills 

ATTR_COUNT_BASE10        = 202;
ATTR_EXTEND0  = ATTR_COUNT_BASE10 + 0;			--Record the type of divination main BUFF
ATTR_EXTEND1  = ATTR_COUNT_BASE10 + 1;			--Record the type of sub-BUFF
ATTR_EXTEND2  = ATTR_COUNT_BASE10 + 2;			--Divination is the date when the record
ATTR_EXTEND3  = ATTR_COUNT_BASE10 + 3;			--Record the number of hidden treasures
ATTR_EXTEND4  = ATTR_COUNT_BASE10 + 4;			--Receive time digging treasure props
ATTR_EXTEND5  = ATTR_COUNT_BASE10 + 5;			--Receive double time
ATTR_EXTEND6  = ATTR_COUNT_BASE10 + 6;			--Double recording time remaining
ATTR_EXTEND7  = ATTR_COUNT_BASE10 + 7;			--DEBUFF remember bits of information when
ATTR_EXTEND8  = ATTR_COUNT_BASE10 + 8;			--Winter Island, the number of daily and run business tasks
ATTR_EXTEND9  = ATTR_COUNT_BASE10 + 9;			--Winter Island and run business tasks of daily time

ATTR_MAX_NUM                = 213;
