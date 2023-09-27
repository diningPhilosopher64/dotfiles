
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

-- local width = {
--   layout_config = {
--     width = 0.8,
--   }
-- }

-- lvim.builtin.telescope.pickers.live_grep = {
--   layout_strategy = "horizontal",
--   layout_config = {
--   width = 1,
--   },
-- }

-- lvim.builtin.telescope.pickers = {
--   find_files = {
--     layout_config = {
--       width = 0.8,
--         height = 0.95 
--     },
--   },
--   live_grep = {
--     layout_config = {
--       width = 0.95,
--         height = 0.95 
--     },
--   },
-- }
lvim.builtin.telescope.pickers.find_files = {
     layout_strategy = "center",
     layout_config = { width = 0.80, height = 0.80, preview_width = nil, prompt_position = "top" }
}

lvim.builtin.telescope.pickers.live_grep = {
    layout_config = { height = 0.99, width = 0.99, preview_cutoff = 120, preview_width = 0.6, prompt_position = "top" },
    layout_strategy = "horizontal"
}

lvim.builtin.telescope.pickers.git_commits = {
    layout_strategy = "horizontal",
    layout_config = { height = 0.88, width = 0.88, preview_cutoff = 20, preview_width = 0.70, prompt_position = "bottom" }
}

lvim.builtin.telescope.pickers.man_pages = {
    layout_strategy = "horizontal",
    layout_config = { height = 0.99, width = 0.99, preview_cutoff = nil, preview_width = 0.80, prompt_position = "bottom" }
}

lvim.builtin.telescope.pickers.vim_options = { layout_config = { height = 0.66, width = 0.66 } }

lvim.builtin.telescope.pickers.colorscheme = { layout_strategy = "cursor", layout_config = { width = 0.19 } }



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
