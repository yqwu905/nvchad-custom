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
    incremental_selection = {
        enable = true,
        keymaps = {
            node_incremental = "v",
            node_decremental = "V",
        },
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
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true,
    },
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
            "output",
            "deps",
        },
    },
    extensions_list = {
        "fzf",
        "themes",
        "projects",
        "live_grep_args",
    },
}

return M
