local options = {

	number = true, -- Show line numbers
	relativenumber = true, -- Show relative line numbers

	tabstop = 2, -- Set Tab size = 2
	softtabstop = 2, -- Convert Tabs to Spaces
	expandtab = true, -- Convert Tabs to whitespace
	shiftwidth = 2, -- Indent size
}

vim.g.python_recommended_style = 0
vim.g.loaded_perl_provider = 0

for k, v in pairs(options) do
	vim.opt[k] = v
end
