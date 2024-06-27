local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values

local M = {}

M.toggleterm_picker = function()
  local bufnrs = vim.tbl_filter(function(bufnr)
    return vim.bo[bufnr].filetype == 'toggleterm'
  end, vim.api.nvim_list_bufs())

  local opts = {}
  pickers.new(opts, {
    prompt_title = 'ToggleTerm Buffers',
    finder = finders.new_table {
      results = bufnrs,
      entry_maker = function(bufnr)
        local name = vim.api.nvim_buf_get_name(bufnr)
        return {
          value = bufnr,
          ordinal = name,
          display = name,
          bufnr = bufnr,
        }
      end,
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      local open_term = function()
        actions.close(prompt_bufnr)
        vim.cmd("ToggleTerm direction=float")
      end
      map('i', '<CR>', open_term)
      map('n', '<CR>', open_term)
      return true
    end,
  }):find()
end

return M
