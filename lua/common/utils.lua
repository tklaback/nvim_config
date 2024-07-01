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

return M
