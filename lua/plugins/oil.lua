return {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {{'echasnovski/mini.icons', opts = {}}},
    lazy = false,
    config = function()
        require('oil').setup({})
        vim.keymap.set('n', '<leader>-', function()
            -- not sure if i like float more
            require('oil').open()
            -- require('oil').open_float()
        end, { desc = 'Open Oil in floating preview' })
    end,
}
