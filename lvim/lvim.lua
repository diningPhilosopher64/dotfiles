
-- Set terminal shortcut
lvim.builtin.terminal.open_mapping = "<c-t>"


-- Setup which-key support for code folds
lvim.builtin.which_key.setup.plugins.presets.z = true


-- Additional field for which key for trouble plugin
lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

lvim.builtin.lualine.style = "lvim"


lvim.builtin.treesitter.ensure_installed = {
    "python", 
    "bash", 
    "dockerfile", 
    "javascript",
    "typescript", 
    "lua", 
    "json",
    "yaml", 
      "go",
      "gomod",
}
