local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- define keymap()
local keymap = vim.api.nvim_set_keymap

-- Remap \ as leader
keymap("", "\\", "<Nop>", opts)
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"


-- CD to current buffer path
keymap("n", "cd", "<cmd>lcd %:h<cr>", opts)

-- Telescope

keymap("n", "ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "fc", "<cmd>Telescope commands<cr>", opts)

-- Terminal

keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)
