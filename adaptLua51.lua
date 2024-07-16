--接入项目添加
package.path = package.path .. ';behavior3lua/?.lua;behavior3lua/;lualib/?.lua'

function getBTDir()
    local current_dir = io.popen("cd"):read("*l")
    local function normalize_path(path)
        local normalized_path = path:gsub("\\", "/")
        if normalized_path:sub(1, 1) == "/" then
            normalized_path = normalized_path:sub(2)
        end
        return normalized_path
    end
    local parent_dir = normalize_path(current_dir).. "/"
    return parent_dir
end

-- lua 5.1一些方法适配
if _VERSION == "Lua 5.1" then
    table.unpack  = unpack
    table.pack = function(...)
        local args = {...}
        local result = {n = select("#", ...)}
        for i = 1, result.n do
            result[i] = args[i]
        end
        return result
    end
end
