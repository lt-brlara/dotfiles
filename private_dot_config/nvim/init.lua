function Prequire(...)
	local status, lib = pcall(require, ...)
	if status then
		return lib
	end
	--Library failed to load, so perhaps return `nil` or something?
	return nil
end

require("brlara.autocmd")
require("brlara.options")
require("brlara.keymaps")
require("brlara.plugins")
require("brlara.lualine")
require("brlara.colorscheme")
require("brlara.cmp")
require("brlara.lsp")
require("brlara.telescope")
require("brlara.treesitter")
require("brlara.autoclose")
