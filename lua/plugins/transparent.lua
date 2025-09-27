return {
    'xiyaowong/transparent.nvim',
    config = function()
        vim.keymap.set('n', '<leader>t', function()
            vim.cmd('TransparentToggle')
        end)
    end
}
