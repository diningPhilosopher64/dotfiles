local user = os.getenv("USER")
local init_path = string.format("/home/%s/dotfiles/lvim/lua/user/", user)

dofile(init_path .. "keymaps.lua")
dofile(init_path .. "plugins.lua")
