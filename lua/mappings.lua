require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "window up" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "window right" })

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

-- Load mapping utils
local mapping_utils = require "common.mapping_utils"

-- Load custom mappings
local dap_mappings = require "configs.mappings.dap_mappings"
local buffer_mappings = require "configs.mappings.buffer_mappings"

-- Apply dap mappings
mapping_utils.apply_mappings(dap_mappings)

-- Apply buffer mappings
mapping_utils.apply_mappings(buffer_mappings)

-- wrap things with open close things
vim.api.nvim_set_keymap(
  "n",
  '<leader>"',
  ":lua require('common.utils').wrap_with_chars('\"', '\"')<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>{",
  ":lua require('common.utils').wrap_with_chars('{', '}')<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>[",
  ":lua require('common.utils').wrap_with_chars('[', ']')<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>(",
  ":lua require('common.utils').wrap_with_chars('(', ')')<CR>",
  { noremap = true, silent = true }
)
