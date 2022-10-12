lvim.plugins = {
    { "folke/tokyonight.nvim" },
    {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },
    { "fatih/vim-go", run = ':GoUpdateBinaries' },
    { "p00f/nvim-ts-rainbow" },
    { "ggandor/lightspeed.nvim" },
    { "tpope/vim-surround" },
}
