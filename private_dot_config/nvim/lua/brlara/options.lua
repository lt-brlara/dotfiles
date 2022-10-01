local options = {
  number = true, -- Show line numbers

  tabstop     = 2,      -- Set Tab size = 2
  softtabstop = 2,      -- Convert Tabs to Spaces
  expandtab   = true,   -- Convert Tabs to whitespace
  shiftwidth  = 2       -- Indent size

  -- Popout window


}

vim.g.python_recommended_style = 0

for k, v in pairs(options) do
  vim.opt[k] = v
end
