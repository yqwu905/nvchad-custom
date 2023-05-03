local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      {
        "nvimdev/lspsaga.nvim",
        opts = {},
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "phaazon/hop.nvim",
    cmd = { "HopWord" },
    opts = {},
  },

  {
    "numToStr/Comment.nvim",
    keys = { "gc", "gb" },
    init = function()
      require("core.utils").load_mappings "comment"
    end,
    config = function()
      require("Comment").setup()
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutline" },
    opts = {},
  },

  {
    "NvChad/nvterm",
    enabled = false,
  },

  {
    "akinsho/toggleterm.nvim",
    init = function()
      require("core.utils").load_mappings "toggleterm"
    end,
    cmd = { "ToggleTerm" },
    opts = {},
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },

  {
    "TimUntersberger/neogit",
    dependencies = {
      {
        "nvim-lua/plenary.nvim",
      },
    },
    opts = {
      integrations = {
        diffview = true,
      },
    },
    cmd = { "Neogit" },
  },

  {
    "sindrets/diffview.nvim",
    init = function()
      require("core.utils").load_mappings "diffview"
    end,
    opts = {},
    cmd = { "DiffviewFileHistory", "DiffviewOpen" },
  },

  {
    "kevinhwang91/nvim-bqf",
    opts = {},
    event = "VeryLazy",
  },

  {
    "yqwu905/interestingwords.nvim",
    opts = {},
    dir = "C:\\Users\\pingl\\source\\repos\\interestingwords.nvim",
    lazy = false,
    init = function()
      require("core.utils").load_mappings "interestingwords"
    end,
  },
}

return plugins
