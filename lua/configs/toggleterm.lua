require('toggleterm').setup {
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1',
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'float',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'curved',
    highlights = {
      border = 'Normal',
      background = 'Normal',
    },
  },
}

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
