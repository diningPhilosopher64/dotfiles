
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })

local lspconfig = require "lspconfig"
require("lvim.lsp.manager").setup("tsserver", { })



-- setup linting 
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint_d", filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" } },
}
