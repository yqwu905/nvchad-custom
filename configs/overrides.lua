local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    -- "markdown_inline", -- 此parser会导致在较长的markdown文档中出现打开过慢的情况.
    "python",
    "cpp",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- python
    "jedi-language-server",
    "yapf",

    -- c/cpp stuff
    "clangd",
    "clang-format",
    "cmake-language-server",
    "xmlformatter",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  defaults = {
    file_ignore_patterns = {
      "cscope.out",
      "tags",
    },
  },
  extensions_list = {
    "fzf",
    "themes",
  }
}

return M
