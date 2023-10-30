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

    -- Preview function definition
    {
        'rmagatti/goto-preview',
      config = function()
        require('goto-preview').setup({
                references = { -- Configure the telescope UI for slowing the references cycling window.
    telescope = require("telescope.themes").get_dropdown({ hide_preview = false, layout_config = { width=0.99 }})
  };
            })
      end
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

    -- Mini plugins
    -- { 'echasnovski/mini.nvim', version = false },
    { 'echasnovski/mini.indentscope', version = false,
        config = function()
            require("mini.indentscope").setup({
      -- Draw options
      draw = {
        -- Delay (in ms) between event and start of drawing scope indicator
        delay = 0,

        -- Animation rule for scope's first drawing. A function which, given
        -- next and total step numbers, returns wait time (in ms). See
        -- |MiniIndentscope.gen_animation| for builtin options. To disable
        -- animation, use `require('mini.indentscope').gen_animation.none()`.
        -- animation = --<function: implements constant 20ms between steps>,
        animation = require('mini.indentscope').gen_animation.none(), --<function: implements constant 20ms between steps>,

        -- Symbol priority. Increase to display on top of more symbols.
        priority = 2,
      },

      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        -- Textobjects
        object_scope = 'ii',
        object_scope_with_border = 'ai',

        -- Motions (jump to respective border line; if not present - body line)
        goto_top = 'gt',
        goto_bottom = 'gb',
      },

      -- Options which control scope computation
      options = {
        -- Type of scope's border: which line(s) with smaller indent to
        -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
        border = 'both',

        -- Whether to use cursor column when computing reference indent.
        -- Useful to see incremental scopes with horizontal cursor movements.
        indent_at_cursor = true,

        -- Whether to first check input line to be a border of adjacent scope.
        -- Use it if you want to place cursor on function header to get scope of
        -- its body.
        try_as_border = false,
      },

      -- Which character to use for drawing scope indicator
      symbol = '╎',
    })
        end,
    },


    -- Language specific plugins

    -- golang
    { "fatih/vim-go", build = ':GoUpdateBinaries' },
      {"leoluz/nvim-dap-go"},


    -- move around faster 
    { "ggandor/leap.nvim" },

    -- surround text easily
    { "tpope/vim-surround" },

    -- repeat - plugin level commands.
    { "tpope/vim-repeat" },

    -- lualine 
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- icons 
    {'nvim-tree/nvim-web-devicons'},

    -- go debugging
    {  "leoluz/nvim-dap-go"}, 
    

    -- {
    --   "nvim-neorg/neorg",
    --   ft = "norg", -- lazy-load on filetype
    --   config = true, -- run require("neorg").setup()
    -- },

}


-- Load leap.nvim with default mappings
require('leap').add_default_mappings()

-- peek definition
lvim.keys.normal_mode["gpd"] = {"<cmd>lua require('goto-preview').goto_preview_definition()<CR>"  , { noremap = true } }
lvim.keys.normal_mode["gpc"] = {"<cmd>lua require('goto-preview').close_all_win()<CR>"  , { noremap = true } }
lvim.keys.normal_mode["gpr"] = {"<cmd>lua require('goto-preview').goto_preview_references()<CR>"  , { noremap = true } }
