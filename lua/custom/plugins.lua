local plugins = {
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.formatter"
    end
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
        "eslint-lsp",
        "typescript-language-server",
        "tailwindcss-language-server"
      }
    },
    {
      "olrtg/nvim-emmet",
      config = function ()
        vim.keymap.set({"n", "v"}, '<leader>xe', require("nvim-emmet").wrap_with_abbreviation)
      end
    },
    {
      "neovim/nvim-lspconfig",
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
      end,
    },
    {
      "windwp/nvim-ts-autotag",
      ft = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact"
      },
      config = function ()
        require("nvim-ts-autotag").setup()
      end
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function ()
        opts = require "plugins.configs.treesitter"
        opts.ensure_installed = {
          "lua",
          "javascript",
          "typescript",
          "tsx",
          "rust",
        }
      end
    }
  }
}

return plugins
