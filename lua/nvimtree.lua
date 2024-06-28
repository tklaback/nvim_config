local nvim_tree = require('nvim-tree')

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  -- vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
  vim.keymap.set('n', '<leader>a', function()
    vim.cmd('wincmd l')
  end, opts('Focus Buffer'))
end

nvim_tree.setup({
  filters = {
    dotfiles = false,  -- Set this to false to show hidden files
  },
  on_attach = my_on_attach,
})
