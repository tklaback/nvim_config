local nvim_tree = require('nvim-tree')

nvim_tree.setup({
  filters = {
    dotfiles = false,  -- Set this to false to show hidden files
  },
})
