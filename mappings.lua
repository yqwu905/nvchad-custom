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

M.lspconfig = {
  plugin = true,
  n = {
    ["gd"] = { "<cmd>Lspsaga peek_definition<cr>", "peek definition" },
    ["gD"] = { "<cmd>Lspsaga goto_definition<cr>", "goto definition" },
    ["gt"] = { "<cmd>Lspsaga peek_type_definition<cr>", "peek type" },
    ["gT"] = { "<cmd>Lspsaga goto_type_definition<cr>", "goto type" },
    ["<leader>sl"] = { "<cmd>Lspsaga show_line_diagnostics<cr>", "line diag" },
    ["<leader>sc"] = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "cursor diag" },
    ["<leader>sb"] = { "<cmd>Lspsaga show_buf_diagnostics<cr>", "buffer diag" },
    ["<Leader>ci"] = { "<cmd>Lspsaga incoming_calls<cr>", "incoming call" },
    ["<leader>co"] = { "<cmd>Lspsaga outgoing_calls<cr>", "outgoing call" },
    ["K"] = { "<cmd>Lspsaga hover_doc<CR>", "hover_doc" },
  },
}

M.telescope = {
  plugin = true,
  n = {
    ["<leader>fg"] = { "<cmd>Telescope grep_string<cr>", "grep cword" },
    ["<leader>fr"] = { "<cmd>Telescope lsp_references<cr>", "lsp reference" },
    ["<leader>fs"] = { "<cmd>Telescope lsp_workspace_symbols<cr>", "symbols" },
    ["<leader>ft"] = { "<cmd>Telescope<cr>", "telescope" },
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

M.interestingwords = {
  plugin = true,
  n = {
    ["#"] = { "<cmd>InteresingWordsNormalSearch<cr>", "search word" },
    ["N"] = { "<cmd>InteresingWordsJumpPrev<cr>", "prev match" },
    ["n"] = { "<cmd>InteresingWordsJumpNext<cr>", "next match" },
    ["<esc>"] = { "<cmd>InteresingWordsClearHighlight<cr>", "clear search" },
  },
  v = {
    ["#"] = { "<cmd>InteresingWordsVisualSearch<cr>", "search word" },
  }
}

for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

return M
