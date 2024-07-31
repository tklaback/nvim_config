-- common/utils.lua
local M = {}

function M.CloseBuffersExcept(excluded_filetypes)
  local excluded_set = {}
  for _, ft in ipairs(excluded_filetypes) do
    excluded_set[ft] = true
  end

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) then
      local buf_ft = vim.bo[buf].filetype
      if not excluded_set[buf_ft] then
        vim.api.nvim_buf_delete(buf, {})
      end
    end
  end
end

function M.wrap_with_chars(open_char, close_char)
  local word = vim.fn.expand "<cword>"
  local escaped_word = vim.fn.escape(word, open_char .. close_char)
  vim.cmd("normal! ciw" .. open_char .. escaped_word .. close_char)
end

return M
