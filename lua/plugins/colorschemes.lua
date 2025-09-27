return {
    {
        'rebelot/kanagawa.nvim',
        priority = 1000,
        lazy = false,
    },

    {
        'sainnhe/sonokai',
        priority = 1000,
        lazy = false,
        config = function()
            vim.g.sonokai_style = 'andromeda'
            vim.cmd('colorscheme sonokai')
        end,
    },

    {
        'shaunsingh/nord.nvim',
        priority = 1000,
        lazy = false,
    },

    {
        'AlexvZyl/nordic.nvim',
        priority = 1000,
        lazy = false,
    },
}
