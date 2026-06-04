require("oil").setup()

vim.keymap.set("n", "<leader>fb", "<CMD>Oil<CR>", { desc = "Open parent directory" })
