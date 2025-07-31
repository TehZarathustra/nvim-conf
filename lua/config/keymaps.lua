-- Leader key, set space as the leader key
vim.g.mapleader = ' '
-- Leader + w saves file
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', {noremap = true, silent = true})


vim.keymap.set(
  "n", "<leader>e", vim.diagnostic.open_float,
  { silent = true, desc = "Show diagnostics in a float" }
)
