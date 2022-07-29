-- local user = os.getenv("USER")
local current_dir = string.gsub(debug.getinfo(1).source, "^@(.+/)[^/]+$", "%1")

dofile(current_dir .. "keymaps.lua")
dofile(current_dir .. "plugins.lua")
dofile(current_dir .. "options.lua")
dofile(current_dir .. "trouble.lua")
