local lsp = require('lsp-zero')
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

lsp.preset('recommended')

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here 
	-- with the ones you want to install
	ensure_installed = {
		'lua_ls',
		'gopls',
		'terraformls',
		'rust_analyzer'
},
	handlers = {
		lsp.default_setup,
	},
})


lsp.setup()

require("lspconfig").lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          'vim',
          'require'
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
