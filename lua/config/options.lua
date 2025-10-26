-- basic settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true

vim.o.wrap = false
vim.o.cursorline = true
vim.o.clipboard = 'unnamedplus'
vim.o.scrolloff = 999

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.winborder = 'rounded'

-- move to some other place?
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = false,
    update_in_insert = false,
    severity_sort = true,
})

-- allow project local configs
vim.opt.exrc = true

