-- basic settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true

vim.o.wrap = false
vim.o.cursorline = true
vim.o.clipboard = "unnamedplus"
vim.o.scrolloff = 999

-- number of spaces a tab represents
vim.o.tabstop = 4
-- number of spaces for each indentation
vim.o.shiftwidth = 4
-- convert tabs to spaces
vim.o.expandtab = true

vim.o.winborder = "rounded"

-- move to some other place?
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

