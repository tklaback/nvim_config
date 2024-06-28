
local toggleterm_manager = require("toggleterm-manager")
local actions = toggleterm_manager.actions

toggleterm_manager.setup {
	mappings = {
	    n = {
	      ["<CR>"] = { action = actions.toggle_term, exit_on_action = true },
	      ["x"] = { action = actions.delete_term, exit_on_action = false },
        ["<C-i>"] = { action = actions.create_term, exit_on_action = false }, -- creates a new terminal buffer
        ["<C-d>"] = { action = actions.delete_term, exit_on_action = false }, -- deletes a terminal buffer
        ["<C-r>"] = { action = actions.rename_term, exit_on_action = false },
	    },
	},
}

