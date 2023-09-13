-- lvim.plugins = {
--     -- { "folke/tokyonight.nvim" },
--     -- {
--     --     "folke/trouble.nvim",
--     --     requires = "kyazdani42/nvim-web-devicons",
--     --     config = function()
--     --         require("trouble").setup {
--     --             -- your configuration comes here
--     --             -- or leave it empty to use the default settings
--     --             -- refer to the configuration section below
--     --         }
--     --     end
--     -- },
--     -- { "fatih/vim-go", run = ':GoUpdateBinaries' },
--     -- { "ggandor/lightspeed.nvim" },
--     -- { "tpope/vim-surround" },
-- }

lvim.plugins = {
    -- color schemes
    -- { "lunarvim/colorschemes" },
    -- { "folke/tokyonight.nvim" },

    -- Augment LSP support 
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
         -- your configuration comes here
         -- or leave it empty to use the default settings
         -- refer to the configuration section below
        },
    },
    

    -- moves ui inputs from command window slot to pop-ups
    {
      "stevearc/dressing.nvim",
      config = function()
        require("dressing").setup({
          input = { enabled = false },
        })
      end,
    },

    -- Language specific plugins

    -- golang
    { "fatih/vim-go", build = ':GoUpdateBinaries' },


    -- move around faster 
    { "ggandor/leap.nvim" },

    -- surround text easily
    { "tpope/vim-surround" },

    -- repeat - plugin level commands.
    { "tpope/vim-repeat" },

    -- {
    --   "nvim-neorg/neorg",
    --   ft = "norg", -- lazy-load on filetype
    --   config = true, -- run require("neorg").setup()
    -- },
}


-- Load leap.nvim with default mappings
require('leap').add_default_mappings()

