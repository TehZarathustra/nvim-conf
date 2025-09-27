return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',      -- LSP completion source
        'hrsh7th/cmp-buffer',        -- buffer words
        'hrsh7th/cmp-path',          -- file paths
        'L3MON4D3/LuaSnip',          -- snippets engine
        'saadparwaiz1/cmp_luasnip',  -- LuaSnip source
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                ['<CR>'] = cmp.mapping.confirm({select = true}),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
            sources = {
                {name = 'nvim_lsp'},
                {name = 'buffer'},
                {name = 'path'},
                {name = 'luasnip'},
            },
        })
    end,
}

