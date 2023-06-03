---@type MappingsTable
local M = {}
local utils = require "custom.utils"

local move_buf_left = function()
    require("nvchad_ui.tabufline").move_buf(-1)
end

local move_buf_right = function()
    require("nvchad_ui.tabufline").move_buf(-1)
end

local toggle_transparency = function()
    require("base46").toggle_transparency()
end

local toggle_theme = function()
    require("base46").toggle_theme()
end

M.general = {
    plugin = false,
    n = {
        [";"] = { ":", "enter command mode", opts = { nowait = true } },
        ["s"] = { "<cmd>HopWord<cr>", "hop" },
        ["<leader>bh"] = { move_buf_left, "move buffer left" },
        ["<leader>bl"] = { move_buf_right, "move buffer right" },
        ["<leader>e"] = { "<cmd>e<cr>", "reload" },
        ["<leader>gg"] = { "<cmd>Neogit<cr>", "neogit" },
        ["<leader>lz"] = { "<cmd>Lazy<cr>", "lazy" },
        ["<leader>qq"] = { "<cmd>wqa<cr>", "save & quit" },
        ["<leader>rr"] = { utils.async_run_code, "run code" },
        ["<leader>so"] = { "<cmd>SymbolsOutline<cr>", "outline" },
        ["<leader>tp"] = { toggle_transparency, "toggle transparency" },
        ["<leader>tt"] = { toggle_theme, "toggle theme" },
    },
    i = {
        ["<c-s>"] = { "<c-o><cmd>update<cr>", "save" },
    },
    t = {
        ["<esc>"] = { "<C-\\><C-n>", "escape input mode" },
    },
}

M.toggleterm = {
    plugin = true,
    n = {
        ["<a-h>"] = { "<cmd>ToggleTerm direction=horizontal<cr>", "hterm" },
        ["<a-i>"] = { "<cmd>ToggleTerm direction=float<cr>", "hterm" },
        ["<a-v>"] = { "<cmd>ToggleTerm direction=vertical<cr>", "hterm" },
    },
    t = {
        ["<a-h>"] = { "<cmd>ToggleTerm direction=horizontal<cr>", "hterm" },
        ["<a-i>"] = { "<cmd>ToggleTerm direction=float<cr>", "hterm" },
        ["<a-v>"] = { "<cmd>ToggleTerm direction=vertical<cr>", "hterm" },
    },
}

M.telescope = {
    plugin = true,
    n = {
        ["<leader>fg"] = { "<cmd>Telescope grep_string<cr>", "grep cword" },
        ["<leader>fr"] = { "<cmd>Telescope lsp_references<cr>", "lsp reference" },
        ["<leader>fs"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "symbols" },
        ["<leader>ft"] = { "<cmd>Telescope tags<cr>", "tags" },
        ["<leader>fw"] = {
            "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
            "grep cword",
        },
        ["<leader>ts"] = { "<cmd>Telescope<cr>", "telescope" },
    },
}

M.diffview = {
    plugin = true,
    n = {
        ["<leader>df"] = { "<cmd>DiffviewFileHistory<cr>", "file history" },
        ["<leader>dv"] = { "<cmd>DiffviewOpen<cr>", "diffview open" },
    },
}

M.gitsigns = {
    plugin = true,
    n = {
        ["<leader>sh"] = { "<cmd>Gitsigns stage_hunk<cr>", "stage hunk" },
    },
}

M.hi_my_words = {
    plugin = true,
    n = {
        ["#"] = { "<cmd>HiMyWordsToggle<cr>", "highlight all occurence" },
        ["<esc>"] = { "<cmd>HiMyWordsToggle<cr>", "remove highlight" },
    },
}

M.presistence = {
    plugin = true,
    n = {
        ["<leader>qs"] = { [[<cmd>lua require("persistence").load()<cr>]], "dir session" },
        ["<leader>ql"] = { [[<cmd>lua require("persistence").load({ last = true })<cr>]], "last session" },
        ["<leader>qd"] = { [[<cmd>lua require("persistence").stop()<cr>]], "stop session" },
    },
}

M.tablemode = {
    plugin = true,
    n = {
        ["<leader>tm"] = { "<cmd>TableModeToggle<cr>", "table mode" },
    },
}

M.lspconfig = {
    plugin = true,
    n = {
        ["gd"] = { "<cmd>Lspsaga peek_definition<cr>", "peek definition" },
        ["gD"] = { "<cmd>Lspsaga goto_definition<cr>", "goto definition" },
        ["gh"] = { "<cmd>Lspsaga lsp_finder<cr>", "lsp finder" },
        ["<leader>sl"] = { "<cmd>Lspsaga show_line_diagnostics<cr>", "line diag" },
        ["<leader>sc"] = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "cursor diag" },
        ["<leader>sb"] = { "<cmd>Lspsaga show_buf_diagnostics<cr>", "buffer diag" },
        ["<Leader>ci"] = { "<cmd>Lspsaga incoming_calls<cr>", "incoming call" },
        ["<leader>co"] = { "<cmd>Lspsaga outgoing_calls<cr>", "outgoing call" },
        ["K"] = { "<cmd>Lspsaga hover_doc<CR>", "hover_doc" },
    },

    v = {
        ["<leader>fm"] = {
            function()
                vim.lsp.buf.format { async = true }
            end,
            "format",
        },
    },
}

for i = 1, 9, 1 do
    vim.keymap.set("n", string.format("<A-%s>", i), function()
        vim.api.nvim_set_current_buf(vim.t.bufs[i])
    end)
end

return M
