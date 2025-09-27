return {
    'pmizio/typescript-tools.nvim',
    ft = {'typescript', 'typescriptreact', 'javascript', 'javascriptreact'},
    dependencies = {
        'nvim-lua/plenary.nvim',
        'neovim/nvim-lspconfig',
    },
    opts = {
        settings = {
            separate_diagnostic_server = true,
            publish_diagnostic_on = 'insert_leave',
            expose_as_code_action = {
                'add_missing_imports',
                'remove_unused_imports',
                'remove_unused',
                'fix_all',
            },
        },
    },

    config = function(_, opts)
        require('typescript-tools').setup(opts)

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local bufnr = args.buf
                local map = function(mode, lhs, rhs)
                    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
                end

                map('n', 'gd', vim.lsp.buf.definition)
                map('n', 'K', vim.lsp.buf.hover)
                map('n', 'gr', vim.lsp.buf.references)
                map('n', 'gi', vim.lsp.buf.implementation)
                map('n', '<leader>rn', vim.lsp.buf.rename)
                map('n', '<leader>ca', vim.lsp.buf.code_action)
                map('n', '<leader>h', function() vim.lsp.buf.format { async = true } end)
            end,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
        if ok then
            capabilities = cmp_lsp.default_capabilities(capabilities)
        end

    end,
}
