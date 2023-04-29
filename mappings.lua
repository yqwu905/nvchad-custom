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
  n = {
        [";"] = { ":", "enter command mode", opts = { nowait = true } },
        ["s"] = { "<cmd>HopWord<cr>", "hop" },
        ["<a-h>"] = { "<cmd>ToggleTerm direction=horizontal<cr>", "hterm" },
        ["<a-i>"] = { "<cmd>ToggleTerm direction=float<cr>", "hterm" },
        ["<a-v>"] = { "<cmd>ToggleTerm direction=vertical<cr>", "hterm" },
        ["<leader>qq"] = { "<cmd>wqa<cr>", "save & quit" },
        ["<leader>bh"] = { move_buf_left, "move buffer left" },
        ["<leader>bl"] = { move_buf_right, "move buffer right" },
        ["<leader>lz"] = { "<cmd>Lazy<cr>", "lazy" },
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
        ["<a-h>"] = { "<cmd>ToggleTerm direction=horizontal<cr>", "hterm" },
        ["<a-i>"] = { "<cmd>ToggleTerm direction=float<cr>", "hterm" },
        ["<a-v>"] = { "<cmd>ToggleTerm direction=vertical<cr>", "hterm" },
  },
}

for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end
-- more keybinds!

return M
