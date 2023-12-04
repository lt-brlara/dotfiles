local settings = {

  nu             = true,
  relativenumber = true,

  tabstop     = 2,
  softtabstop = 2,
  shiftwidth  = 2,
  expandtab   = true,

  smartindent = true,

  wrap = false,

  undodir  = os.getenv("HOME") .. "/.vim/undodir",
  undofile = true,
  swapfile = false,
  backup   = false,

  hlsearch  = false,
  incsearch = true,

  termguicolors = true,

  scrolloff = 8,

  updatetime = 50,

  colorcolumn = "80"
}

vim.g.mapleader = "\\"

for key, value in pairs(settings) do
	vim.opt[key] = value
end
