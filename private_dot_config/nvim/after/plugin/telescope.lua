local opts = { noremap = true, silent = true }
local icons = require "blara.icons"
local telescope = require("telescope")
local builtin = require('telescope.builtin')
local keymap = vim.api.nvim_set_keymap

telescope.setup({
  defaults = {
    prompt_prefix = icons.ui.Telescope .. " ",
    selection_caret = "󰓥 ",
    path_display = { "smart" },
    file_ignore_patterns = { "^.git/" },
  },
  pickers = {
    find_files = {
      hidden = true
    }
  },
})

telescope.load_extension "file_browser"

keymap("n", "ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "fc", "<cmd>Telescope commands<cr>", opts)
keymap("n", "<space>fb", "<cmd>Telescope file_browser<cr>", opts)
keymap("n", "fnc", "<cmd>Telescope lsp_document_symbols<cr>", opts)
keymap("n", "<space>fnc", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", opts)

vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep for: ") })
end)


