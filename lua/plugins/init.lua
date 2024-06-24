return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require"configs.lspconfig"
    end,
  },

  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier",
        "solargraph", "pyright", "clangd",
  		},
  	},
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css", "ruby"
  		},
  	},
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function ()
    require("toggleterm").setup {
      size = 120,
      open_mapping = [[<leader>tt]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = false,
      shell = vim.o.shell,
      float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
              border = "Normal",
              background = "Normal",
          },
      },
    }
    end,
    lazy = false
  }
}
