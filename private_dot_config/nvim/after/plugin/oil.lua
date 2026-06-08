require("oil").setup()

vim.keymap.set("n", "<leader><Space>fb", "<CMD>Oil<CR>", { desc = "Open parent directory" })
