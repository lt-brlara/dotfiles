local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "cc", "<cmd>below Compile<cr>", opts)
keymap("n", "cp", "<cmd>Recompile<cr>", opts)
