local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("brlara.lsp.lsp-installer")
require("brlara.lsp.handlers").setup()
