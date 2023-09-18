-- Define a global variable to store the job object
vim.g.run_on_save_job = nil

-- Create a Lua function to set the command
function SetRunOnSaveCommand()
  local user_input = vim.fn.input("Enter the command to run on save: ")
  vim.g.run_on_save_command = user_input
end

-- Define an Ex command that triggers the SetRunOnSaveCommand function
vim.cmd('command! SetRunOnSaveCommand lua SetRunOnSaveCommand()')

-- Create a Lua function to run the command on save

function RunCommandOnSave()
  local command = vim.g.run_on_save_command

  if command and command ~= '' then
    local output = vim.fn.system(command)

    -- Create a new buffer and set its content
    vim.api.nvim_command('new')
    vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.fn.split(output, '\n'))
    vim.api.nvim_buf_set_option(0, 'filetype', 'output')
    vim.api.nvim_buf_set_option(0, 'buftype', 'nofile')
    vim.api.nvim_buf_set_option(0, 'modifiable', false)
    vim.api.nvim_buf_set_option(0, 'readonly', true)
    vim.api.nvim_buf_set_option(0, 'swapfile', false)

    -- Move the new buffer to the bottom
    vim.api.nvim_command('wincmd J')
  else
    print("No command set. Use :SetRunOnSaveCommand to set the command.")
  end
end

-- Set up an autocmd to trigger the RunCommandOnSave function on save
vim.api.nvim_command([[
  autocmd BufWritePost * lua RunCommandOnSave()
]])
