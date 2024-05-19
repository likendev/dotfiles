-- Set leader
vim.g.mapleader = " "

-- Tab settings
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- General settings
vim.wo.number = true
vim.o.scrolloff = 8
vim.o.colorcolumn = "80"

vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.breakindent = true
vim.o.undofile = true

vim.o.clipboard = "unnamedplus"
vim.wo.signcolumn = "yes"
vim.o.termguicolors = true
vim.o.mouse = "a"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.completeopt = "menuone,noselect"

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})
