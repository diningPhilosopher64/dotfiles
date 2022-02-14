local fn = vim.fn

-- Will install plugins to .local/share/nvim:w
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  
  -- Utility
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter 
  use 'kyazdani42/nvim-tree.lua'
  -- use "numToStr/Comment.nvim" -- Easily comment stuff
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  use "akinsho/toggleterm.nvim"
    -- git
  use "lewis6991/gitsigns.nvim"
  -- Need this for some wierd behaviour with
  -- Nvim-tree closing ?
  use "moll/vim-bbye"
  -- Required for telescope
  -- Will need to install ripgrep, TreeSitter, plenary and fd additionally
  -- Run :checkhealth telescope on how to install
  use 'nvim-telescope/telescope.nvim'
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "nvim-telescope/telescope-media-files.nvim"
  -- Lazy loading:
  -- Load on specific commands
  -- When either Dispatch, Make, Focus, Start etc are run as a command, this plugin will be loaded and do its thing.
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  
   -- Plugins can have post-install/update hooks
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}



   -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Aesthetics   
  use 'gruvbox-community/gruvbox'
  use "lunarvim/colorschemes"
  use 'ryanoasis/vim-devicons'
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}


  -- code completion
  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
   

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer


  
-- Post-install/update hook with neovim command
-- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use "p00f/nvim-ts-rainbow"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
