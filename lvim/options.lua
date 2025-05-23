local options = {
    hidden = true,
    showcmd = true,
    syntax = "on",
    shiftwidth = 4,
    incsearch = true,
    scrolloff = 8,
    number = true,
    relativenumber = true,
    tabstop = 2,
    softtabstop = 4,
    sidescrolloff = 8,
    smartindent = true,
    autoindent = true,
    filetype = "on",
    backup = false, -- creates a backup file
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 1, -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0, -- so that `` is visible in markdown files
    fileencoding = "utf-8", -- the encoding written to a file
    hlsearch = false, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    mouse = "a", -- allow the mouse to be used in neovim
    pumheight = 10, -- pop up menu height
    showtabline = 2, -- always show tabs
    smartcase = true, -- smart case
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- creates a swapfile
    termguicolors = true, -- set term gui colors (most terminals support this)
    timeoutlen = 200, -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true, -- enable persistent undo
    updatetime = 300, -- faster completion (4000ms default)
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true, -- convert tabs to spaces
    cursorline = true, -- highlight the current line
    numberwidth = 4, -- set number column width to 2 {default 4}
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    wrap = false, -- display lines as one long line
    foldmethod = "indent", 
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end


vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd "set backspace=indent,eol,start"
vim.cmd "set colorcolumn=80"
-- vim.cmd "set nohlsearch"
vim.cmd "set noerrorbells"
vim.cmd "highlight CursorLine  term=NONE cterm=NONE ctermbg=236"
vim.cmd [[set iskeyword+=-]] -- will treat '-' as part of the word. So you can do 'dw' and it will delete the whole word.