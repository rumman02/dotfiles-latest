local M = {}

-----------------------fix the annoying q: keymap without breaking q macro keymap---------------------------
function M.handle_q_colon_key()

  -- when alreaddy recording, this vFunc.reg_recording() this function returns recording register (ex: a/b/c..) 
  -- & when not recording, it returns empty string (ex: '')
  if vim.fn.reg_recording() == '' then
    -- when call that vFunc.getcharstr() function, after calling this waiting for key press and returns the key
    local key = vim.fn.getcharstr()

    -- if after pressing q, the key is ":" then leave function
    if key ~= ':' then
      -- if after pressing q, the key is "keys" then 
      -- this vApi.nvim_feedkeys() function will send the given "keys" to nvim, that is q + "keys" with normal mode
      -- which is starting recording macros (ex: qa)
      vim.api.nvim_feedkeys('q' .. key, "n", true)
    end
  else
    -- when already into recording, after pressing q is the given intput key also q, so that nvim can recognize as quit macro
    vim.api.nvim_feedkeys('q', "n", true)
  end

  -- return

end

-----------------------close the terminal buffer under cursor---------------------------
function M.close_terminal_buffer()
  local buf = vim.api.nvim_get_current_buf()

  if vim.bo[buf].buftype == "terminal" then
    vim.api.nvim_buf_delete(buf, { force = true })
  end

end

-----------------------close the terminal all buffers without focus---------------------------
function M.close_all_terminal_buffers()
  local buffers = vim.api.nvim_list_bufs()

  for _, buf in ipairs(buffers) do

    if vim.bo[buf].buftype == "terminal" then
      vim.api.nvim_buf_delete(buf, { force = true })
    end

  end

end

return M
