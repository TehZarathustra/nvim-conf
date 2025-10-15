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
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- @TODO make it project-local (exrc)
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'javascript',
    callback = function()
        vim.opt_local.makeprg = 'node --test-reporter=tap %'
        vim.opt_local.errorformat ='  location: "%f:%l:%c"'
    end,
})

-- @TODO, start doing it in another file
local root = vim.fn.expand('~/arcadia/distribution_interface/frontend/static')

local function setup_makeprg()
  local dir = vim.fn.expand('%:p:h')
  local rel = dir:gsub(vim.pesc(root .. '/'), '')
  vim.opt_local.makeprg = string.format(
    [[sh -lc "cd %s && npm run tanker-sync %s"]],
    root,
    vim.fn.shellescape(rel)
  )
end

vim.api.nvim_create_augroup('KeysetsSync', {clear = true})
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = root .. '/**/keysets.js',
  callback = setup_makeprg,
  group = 'KeysetsSync',
})
