local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values

local M = {}

M.toggleterm_picker = function()
  local terminals = require('toggleterm.terminal').get_all()
  vim.api.nvim_out_write(vim.inspect(terminals) .. "\n")
  local opts = {}
  pickers.new(opts, {
  prompt_title = 'ToggleTerm Buffers',
    finder = finders.new_table {
      results = terminals,
      entry_maker = function(bufnr)
        return {
          value = bufnr,
          ordinal = bufnr,
          display = bufnr,
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
      map('n', '<CR>', open_term)
      return true
    end,
  }):find()
end

return M
