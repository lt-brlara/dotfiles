AutoRunBufNR = nil
AutoRunJobStarted = false

local attach_to_buffer = function(pattern, command)
  local buffer_is_visible = function(bufnr)
    local visible_buffers = {}

    -- Iterate over all windows
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      table.insert(visible_buffers, buf)
    end

    local found = false
    for _, v in pairs(visible_buffers) do
      if v == bufnr then
        found = true
      end
    end

    return found
  end

  if AutoRunBufNR == nil then
    vim.cmd("vnew AutoRun")
    AutoRunBufNR = vim.api.nvim_get_current_buf()
  end

  vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("MyAugroup", { clear = true }),
    pattern = pattern,
    callback = function()
      local append_data = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(AutoRunBufNR, -1, -1, false, data)
        end
      end
      vim.api.nvim_buf_set_lines(AutoRunBufNR, 0, -1, false, { "Building project:", "" })
      if AutoRunJobStarted then
        vim.fn.jobstop(AutoRunJobNR)
      end
      AutoRunJobNR = vim.fn.jobstart(command, {
        stdout_buffered = true,
        on_stdout = append_data,
        on_stderr = append_data
      })
      AutoRunJobStarted = true
      if not buffer_is_visible(AutoRunBufNR) then
        vim.cmd("vert sb" .. tostring(AutoRunBufNR))
      end
    end,
  })
end

vim.api.nvim_create_user_command("AutoRun", function()
  pattern = vim.fn.input("Pattern: ")
  command = vim.split(vim.fn.input("Command: "), " ")
  attach_to_buffer(pattern, command)
end, {})
