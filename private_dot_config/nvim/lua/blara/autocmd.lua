-- Autocommand that runs 'chezmoi apply' when dotfile is modified
vim.cmd [[
  autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --force
]]

-- Reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup lazy_auto_sync
    autocmd!
    autocmd BufWritePost lazy.lua source <afile> | Lazy sync
  augroup end
]])

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.cmd('GoFmt')
  end,
  group = format_sync_grp,
})
