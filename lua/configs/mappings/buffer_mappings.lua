local M = {}

M.buffer = {
  n = {
    ["<leader>wc"] = {
      ":lua CloseAllBuffersExceptNvimTree()<CR>",
      "Close all buffers except Nvim Tree",
    },
  },
}

function CloseAllBuffersExceptNvimTree()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) then
      local buf_ft = vim.bo[buf].filetype
      if buf_ft ~= "NvimTree" then
        vim.api.nvim_buf_delete(buf, {})
      end
    end
  end
end

return M
