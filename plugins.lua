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
      require "custom.configs.lspconfig"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -G Ninja -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
    },
    opts = overrides.telescope,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "telescope")
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-context", opts = {} },
    },
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
    config = function(_, opts)
      vim.opt.shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell"
      vim.opt.shellcmdflag =
        "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
      vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
      vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
      vim.opt.shellquote = ""
      vim.opt.shellxquote = ""
      require("toggleterm").setup(opts)
    end,
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
    cmd = {
      "InteresingWordsNormalSearch",
      "InteresingWordsJumpPrev",
      "InteresingWordsJumpNext",
      "InteresingWordsClearHighlight",
      "InteresingWordsVisualSearch",
    },
    init = function()
      require("core.utils").load_mappings "interestingwords"
    end,
  },

  {
    "dhruvasagar/vim-table-mode",
    init = function()
      require("core.utils").load_mappings "tablemode"
      vim.g.table_mode_corner = "|"
    end,
    cmd = { "TableModeToggle" },
  },

  {
    "folke/persistence.nvim",
    init = function()
      require("core.utils").load_mappings "presistence"
    end,
    event = "BufReadPre",
    opts = {
      user = "w30044123",
    },
  },
}

return plugins
