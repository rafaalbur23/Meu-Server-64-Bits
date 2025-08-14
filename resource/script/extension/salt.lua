--[[

Author: VaiN474 - http://github.com/VaiN474
Last Update: March 10, 2023 by @valdiney_eviles
Description:
    saves and load LUA tables to and from files.

    - Human-readable and indented.
    - Tables are loaded using loadfile().
    - Supported types: number, string, boolean, sub-tables of same.
    - Useful for persisting data between program executions or for sharing data with other programs

[API]:

- salt.save:
    This function takes a Lua table, a file path, and an optional boolean flag to indicate whether to compress the output or not. It serializes the table and writes it to the file in a Lua table format.

- salt.load:
    This function takes a file path and returns the contents of the file as a Lua table.

[Example Usage]:

    salt = require("salt")
    salt.save(my_table,"/path/to/file")
    
    * additional param: boolean to compress data

    my_table,err = salt.load("/path/to/file")
]]

salt = {}

function salt.save(tbl, file, compressed)
    local f, err = io.open(file, "w")
    if err then
        print(err)
        return
    end

    local indent = 1

    -- local functions to make things easier
	local function exportstring(s)
		return string.format("%q", s)
	end

    local function serialize(o)
        if type(o) == "number" then
            f:write(o)
        elseif type(o) == "boolean" then
            if o then
                f:write("true")
            else
                f:write("false")
            end
        elseif type(o) == "string" then
            f:write(exportstring(o))
        elseif type(o) == "table" then
            f:write("{" .. (compressed and "" or "\n"))
            indent = indent + 1
            local tab = string.rep("    ", indent)
            for k, v in pairs(o) do
                f:write((compressed and "" or tab) .. "[")
                serialize(k)
                f:write("]" .. (compressed and "=" or " = "))
                serialize(v)
                f:write("," .. (compressed and "" or "\n"))
            end
            indent = indent - 1
            tab = string.rep("    ", indent)
            f:write((compressed and "" or tab) .. "}")
        else
            print("unable to serialize data: " .. tostring(o))
            f:write("nil," .. (compressed and "" or " -- ***ERROR: unsupported data type: " .. type(o) .."!***"))
        end
    end

    f:write("return {" .. (compressed and "" or "\n"))
    local tab = "    "
    for k, v in pairs(tbl) do
        f:write((compressed and "" or tab) .. "[")
        serialize(k)
        f:write("]" .. (compressed and "=" or " = "))
        serialize(v)
        f:write("," .. (compressed and "" or "\n"))
    end
    f:write("}")
    f:close()
end

function salt.load(file)
    local chunk, err = loadfile(file)
    if not chunk then
        return nil, err
    else
        setfenv(chunk, {})
        return chunk()
    end
end