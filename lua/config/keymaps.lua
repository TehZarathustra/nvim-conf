vim.g.mapleader = ' '

vim.api.nvim_set_keymap(
    'n', '<Leader>w', ':w<CR>',
    {noremap = true, silent = true, desc = 'basically :w'}
);

vim.keymap.set(
    'n', '<leader>e', vim.diagnostic.open_float,
    {silent = true, desc = 'shows popup diagnostics'}
)

vim.keymap.set(
    'n', '<leader>\'', ':make<CR>',
    {desc = 'makeprg'}
)
