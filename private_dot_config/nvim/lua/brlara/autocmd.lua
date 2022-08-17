-- Autocommand that runs 'chezmoi apply' when dotfile is modified
vim.cmd [[
  autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --force
]]


