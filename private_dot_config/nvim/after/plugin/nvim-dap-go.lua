require("dapui").setup()
require('dap-go').setup()
require("nvim-dap-virtual-text").setup {
  -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
  display_callback = function(variable)
    local name = string.lower(variable.name)
    local value = string.lower(variable.value)
    if name:match "secret" or name:match "api" or value:match "secret" or value:match "api" then
      return "*****"
    end

    if #variable.value > 15 then
      return " " .. string.sub(variable.value, 1, 15) .. "... "
    end

    return " " .. variable.value
  end,
}

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", opts)
vim.api.nvim_set_keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", opts)
vim.api.nvim_set_keymap("n", "<F3>", "<cmd>lua require'dap'.step_over()<CR>", opts)
vim.api.nvim_set_keymap("n", "<F2>", "<cmd>lua require'dap'.step_into()<CR>", opts)
vim.api.nvim_set_keymap("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", opts)
