local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("COLORSCHEME " .. colorscheme .. " NOT FOUND!")
  return
end