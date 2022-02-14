local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
    local keymap = vim.api.nvim_set_keymap

    --Remap space as leader key
    keymap("", "<Space>", "<Nop>", opts)
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    -- Modes
    --   normal_mode = "n",
    --   insert_mode = "i",
    --   visual_mode = "v",
    --   visual_block_mode = "x",
    --   term_mode = "t",
    --   command_mode = "c",

    -- Normal --
    -- Better navigation between splits
    keymap("n", "<C-h>", "<C-w>h", opts)
    keymap("n", "<C-j>", "<C-w>j", opts)
    keymap("n", "<C-k>", "<C-w>k", opts)
    keymap("n", "<C-l>", "<C-w>l", opts)
    keymap("n", "<TAB>", ":BufferLineMoveNext<CR>", opts)
    keymap("n", "<S-TAB>", ":BufferLineMovePrev<CR>", opts)


    keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Make Shift-y behave like Shift-c or Shift-d
keymap("n", "<S-y>", "y$", opts)

-- When a mark is placed, '<letter> will mean go to the
-- marked line but not column and `<letter> will mean 
-- go to the exact line and column.
-- ` is too far away from home row. 
keymap("n", "'", "`", opts)

-- Keeping it centered when going over next item in search list
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Keeping it centered when joining below line to the current one
keymap("n", "J", "mzJ`z", opts)





-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Switch to Normal mode quickly from home row
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)
keymap("i", "kk", "<ESC>", opts)
keymap("i", "jj", "<ESC>", opts)

-- If in insert mode and want to move line of code, switch to normal/visual mode and
-- use those remaps


-- Easy insertion of a trailing ; or , from insert mode
keymap("i", ";;", "<ESC>A;<ESC>", opts)
keymap("i", ",,", "<ESC>A,<ESC>", opts)


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<leader>j", ":m .+1<CR>==", opts)
keymap("v", "<leader>k", ":m .-2<CR>==", opts)

-- If in Visual mode and want to move line of code

-- Some magic which will allow for selecting blocks of code and 
-- moving them while respecting indenting rules. Instead of ddp'ing
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)



-- Switching to regular behaviour of a single copy and multiple paste.
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>s", "<cmd>Telescope live_grep<cr>", opts)
