local actions = require "telescope.actions"
local actions_state = require "telescope.actions.state"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local Terminal = require("toggleterm.terminal").Terminal

local M = {}

local function exit_terminal(prompt_bufnr)
   local selection = actions_state.get_selected_entry()
   if selection == nil then
      return
   end
   local bufnr = selection.value.bufnr
   local current_picker = actions_state.get_current_picker(prompt_bufnr)
   current_picker:delete_selection(function(selection)
      vim.api.nvim_buf_delete(bufnr, { force = true })
   end)
end

local function create_term(prompt_bufnr)


	local function on_open_terminal()
		actions.close(prompt_bufnr)

		-- the autocommand setup in telescope/init.lua that starts insert mode on leaving the telescope buffer
		-- won't work here since the cursor may move to a non-toggleterm buftype for a brief moment while the
		-- toggleterm buffer is being created
		-- utils.start_insert_mode()
	end

	local term = Terminal:new({ hidden = true })

  term:open()
end

local telescope_mappings = {
    ['<C-c>'] = exit_terminal,
    ['<C-i>'] = create_term
}


function M.terminal_picker()
  local bufnrs = vim.tbl_filter(function(bufnr)
    return vim.bo[bufnr].filetype == "toggleterm"
  end, vim.api.nvim_list_bufs())

  local buffers = {}

  for _, bufnr in ipairs(bufnrs) do
    local info = vim.fn.getbufinfo(bufnr)[1]
    local element = {
      bufnr = info.bufnr,
      changed = info.changed,
      changedtick = info.changedtick,
      hidden = info.hidden,
      lastused = info.lastused,
      linecount = info.linecount,
      listed = info.listed,
      lnum = info.lnum,
      loaded = info.loaded,
      name = info.name,
      windows = info.windows,
      terminal_job_id = info.variables.terminal_job_id,
      terminal_job_pid = info.variables.terminal_job_pid,
      toggle_number = info.variables.toggle_number,
    }
    table.insert(buffers, element)
  end

  pickers
    .new({}, {
      prompt_title = "Terminal Buffers",
      finder = finders.new_table {
        results = buffers,
        entry_maker = function(entry)
          return {
            value = entry,
            text = tostring(entry.bufnr),
            display = tostring(entry.name),
            ordinal = tostring(entry.bufnr),
          }
        end,
      },
      sorter = conf.generic_sorter(),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          local selection = actions_state.get_selected_entry()
          if selection == nil then
            return
          end
          local bufnr = tostring(selection.value.bufnr)
          local toggle_number = selection.value.toggle_number
          require("toggleterm").toggle_command(bufnr, toggle_number)
          -- vim.defer_fn(function()
          --   vim.cmd "stopinsert"
          -- end, 0)
        end)
        for keybind, action in pairs(telescope_mappings) do
          print(keybind)
          map("n", keybind, function()
            action(prompt_bufnr)
          end)
        end
        return true
      end,
    })
    :find()
end
return M
