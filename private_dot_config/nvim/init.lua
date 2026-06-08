print("hello world!")

require("config.lazy")

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅜",
      [vim.diagnostic.severity.WARN]  = "󰀩",
      [vim.diagnostic.severity.HINT]  = "󰌵",
      [vim.diagnostic.severity.INFO]  = "󰋼",
    },
  },
})

vim.keymap.set('n', '<leader>dn', function()
  vim.diagnostic.jump({ count = 1 })
end, { desc = 'Go to next diagnostic' })

vim.keymap.set('n', '<leader>dp', function()
  vim.diagnostic.jump({ count = -1 })
end, { desc = 'Go to previous diagnostic' })

vim.keymap.set('n', '<leader>dv', vim.diagnostic.open_float)

vim.lsp.enable({
  "rust_analyzer",
  "gopls"
})
