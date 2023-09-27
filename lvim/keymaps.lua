-- Make Shift-y behave like Shift-c or Shift-d
lvim.keys.normal_mode["<S-y>"] = "y$"

-- When a mark is placed, '<letter> will mean go to the
-- marked line but not column and `<letter> will mean
-- go to the exact line and column.
-- ` is too far away from home row.
lvim.keys.normal_mode["'"] = "`"

-- Keeping it centered when going over next item in search list
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"


-- Keeping it centered when joining below line to the current one
lvim.keys.normal_mode["J"] = "mzJ`z"

-- Insert mode mappings

-- Switch to Normal mode quickly from home row
lvim.keys.insert_mode["jk"] = { "<ESC>", { noremap = true } }
lvim.keys.insert_mode["kj"] = { "<ESC>", { noremap = true } }

-- If in insert mode and want to move line of code, switch to normal/visual mode and
-- use those remaps
lvim.keys.insert_mode[";;"] = { "<ESC>A;<ESC>", { noremap = true } }
lvim.keys.insert_mode[",,"] = { "<ESC>A,<ESC>", { noremap = true } }

-- Save current buffer
lvim.keys.insert_mode["<C-s>"] = { "<ESC>:w<CR>", { noremap = true } }
-- Close current buffer
lvim.keys.insert_mode["<C-w>"] = { "<ESC>:q<CR>", { noremap = true } }


-- Visual Mode mappings

-- Stay in visual mode when indenting
lvim.keys.visual_mode["<"] = { "<gv", { noremap = true } }
lvim.keys.visual_mode[">"] = { ">gv", { noremap = true } }


-- Move text up and down
lvim.keys.visual_mode["<leader>j"] = { ":m .+1<CR>==", { noremap = true } }


-- If in Visual mode and want to move line of code

-- Some magic which will allow for selecting blocks of code and
-- moving them while respecting indenting rules. Instead of ddp'ing
lvim.keys.visual_mode["J"] = { ":m '>+1<CR>gv=gv", { noremap = true } }
lvim.keys.visual_mode["K"] = { ":m '>+1<CR>gv=gv", { noremap = true } }

-- Switching to expected behaviour of a single copy and multiple paste.
lvim.keys.visual_mode["p"] = { '"_dp', { noremap = true } }
