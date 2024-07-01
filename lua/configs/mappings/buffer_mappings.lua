require "common.utils"

local M = {}

M.buffer = {
  n = {
    ["<leader>wc"] = {
      ":lua require('common.utils').CloseBuffersExcept({'NvimTree', 'toggleterm'})<CR>",
      "Close all buffers except Nvim Tree and ToggleTerm",
    },
  },
}

return M
