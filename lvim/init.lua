-- local user = os.getenv("USER")
local current_dir = string.gsub(debug.getinfo(1).source, "^@(.+/)[^/]+$", "%1")

-- Keymaps and config for nvim.
dofile(current_dir .. "keymaps.lua")
dofile(current_dir .. "options.lua")

-- Plugins with default config
dofile(current_dir .. "plugins.lua")

-- Plugins with custom config
dofile(current_dir .. "trouble.lua")
dofile(current_dir .. "lualine.lua")
