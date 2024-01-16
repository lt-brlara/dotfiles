function DefineColorScheme(color)
	color = color or "onedark"
	vim.cmd.colorscheme(color)
end

DefineColorScheme()
