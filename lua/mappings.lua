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


local Terminal  = require('toggleterm.terminal').Terminal

local terminals = {}

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

function _G.create_terminal()
  local term = Terminal:new({hidden = true, direction = "float"})
  table.insert(terminals, term)
  term:toggle()
end

function _G.toggle_terminal(id)
  if terminals[id] then
    terminals[id]:toggle()
  else
    create_terminal()
  end
end

vim.api.nvim_set_keymap('n', '<leader>t1', '<cmd>lua toggle_terminal(1)<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>t2', '<cmd>lua toggle_terminal(2)<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>t3', '<cmd>lua toggle_terminal(3)<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>t4', '<cmd>lua toggle_terminal(4)<CR>', {noremap = true, silent = true})

