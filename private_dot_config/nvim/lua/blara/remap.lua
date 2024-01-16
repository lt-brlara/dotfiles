local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)
