local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
    pattern = "*",
    command = "tabdo wincmd =",
})

autocmd("TextYankPost", {
    pattern = "*",
    command = 'lua vim.highlight.on_yank({higroup="Visual", timeout=200})',
})

vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

if vim.g.neovide then
    -- local alpha = function()
    --   return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
    -- end
    -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    -- vim.g.neovide_transparency = 0.7
    -- vim.g.transparency = 0.7
    -- vim.g.neovide_background_color = "#e1e2e7" .. alpha()
    vim.g.neovide_scroll_animation_length = 0.2
    -- vim.g.neovide_profiler = true
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_cursor_animation_length = 0.06
    vim.g.neovide_no_idle = true
    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.o.guifont = "JetBrainsMono Nerd Font:h12"
end

if vim.fn.has "wsl" then
    vim.g.clipboard = {
        name = "win32yank",
        copy = {
            ["+"] = "win32yank.exe -i --crlf",
            ["*"] = "win32yank.exe -i --crlf",
        },
        paste = {
            ["+"] = "win32yank.exe -o --lf",
            ["*"] = "win32yank.exe -o --lf",
        },
        cache_enabled = 0,
    }
end

vim.cmd("set noswapfile")
