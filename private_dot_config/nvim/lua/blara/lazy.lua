local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
  {"olimorris/onedarkpro.nvim", tag = "0.8.0"},
  {"morhetz/gruvbox"},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = vim.cmd.TSUpdate
	},
	{'nvim-treesitter/playground'},
	{'mbbill/undotree'},
	{'tpope/vim-fugitive'},

	-- LSP
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},

  -- Go
  { "ray-x/go.nvim" },
  { "ray-x/guihua.lua", build = "cd lua/fzy && make" },

  {"m4xshen/autoclose.nvim"}
}

require("lazy").setup(plugins)
