local function prequire(...)
	local status, lib = pcall(require, ...)
	if status then
		return lib
	end
	--Library failed to load, so perhaps return `nil` or something?
	return nil
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local default_on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
end

require("mason-lspconfig").setup_handlers({
	-- The first entry (without a key) will be the default handler
	function(server_name)
		local server_opts = {
			on_attach = default_on_attach,
			capabilities = capabilities,
			flags = {
				debounce_text_changes = 150,
			},
		}

		local server_specific_opts = prequire("brlara.lsp.settings." .. server_name)
		if server_specific_opts then
			server_opts = vim.tbl_deep_extend("force", server_specific_opts, server_opts)
		end
		require("lspconfig")[server_name].setup(server_opts)
	end,
})
