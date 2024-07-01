require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Move selected block of text up with Ctrl + k
map("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected block up" })

-- Move selected block of text down with Ctrl + j
map("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected block down" })

-- Move line up with Ctrl + kk
map("n", "<C-k><C-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- Move line down with Ctrl + jj
map("n", "<C-j><C-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("t", "<Esc>", "<C-\\><C-n>")

map("n", ";", ";", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>ft", ":Telescope toggleterm_manager<CR>", { noremap = true, silent = true })

-- map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
-- map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or continue the debugger" })

-- Load dap_mappings
local dap_mappings = require "configs.dap_mappings"

-- Apply dap mappings
for mode, mappings in pairs(dap_mappings.dap.n) do
  map("n", mode, mappings[1], { desc = mappings[2] })
end
