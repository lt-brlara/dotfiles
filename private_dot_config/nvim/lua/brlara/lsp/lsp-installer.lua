require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local servers = {
	"sumneko_lua",
	"gopls",
	"pyright",
}

require("mason-lspconfig").setup({
	ensure_installed = servers,
})
