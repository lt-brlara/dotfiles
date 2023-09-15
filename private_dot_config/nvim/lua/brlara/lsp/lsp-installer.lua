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
  "lua_ls",
  "gopls",
  "pyright",
  "terraformls"
}

require("mason-lspconfig").setup({
  ensure_installed = servers,
})
