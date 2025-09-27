return {
    'mfussenegger/nvim-lint',
    event = {
        'BufReadPre',
        'BufNewFile',
    },
    config = function()
        local lint = require('lint')

        lint.linters_by_ft = {
            javascript = {'eslint_d'},
            typescript = {'eslint_d'},
            javascriptreact = {'eslint_d'},
            typescriptreact = {'eslint_d'},
            svelte = {'eslint_d'},
        }

        function tryLint()
            -- if project has no config
            if vim.bo.filetype == 'javascript' or vim.bo.filetype == 'typescript' then
                local eslintConfigFilenames = {
                    'eslint.config.js',
                    'eslint.config.mjs',
                    'eslint.config.cjs',
                    'eslint.config.ts',
                    'eslint.config.mts',
                    'eslint.config.cts',
                    '.eslintrc.js',
                    '.eslintrc.json',
                    '.eslintrc.cjs',
                }
                if vim.fs.root(0, eslintConfigFilenames) == nil then
                    return
                end
            end

            lint.try_lint()
        end

        local lint_augroup = vim.api.nvim_create_augroup('lint', {clear = true})

        vim.api.nvim_create_autocmd({'BufEnter', 'BufWritePost', 'InsertLeave'}, {
            group = lint_augroup,
            callback = function()
                tryLint()
            end,
        })

        vim.keymap.set('n', '<leader>l', function()
            tryLint()
        end, {desc = 'Trigger linting for current file'})

        vim.keymap.set('n', '<leader>L', function()
            vim.fn.jobstart({'eslint_d', 'restart'}, {detach = true})
            print('eslint_d restarted')
        end, {desc = 'Restart eslint_d daemon'})

        vim.keymap.set('n', '<leader>f', function()
            vim.cmd('write')

            local buf = vim.api.nvim_get_current_buf()
            local file = vim.api.nvim_buf_get_name(buf)

            -- run eslint_d --fix asynchronously
            vim.fn.jobstart({'eslint_d', '--fix', file}, {
                stdout_buffered = true,
                stderr_buffered = true,
                on_exit = function(_, code, _)
                    if code == 0 then
                        -- reload the buffer to pick up fixes
                        vim.schedule(function()
                            vim.cmd('edit!')
                            vim.notify('ESLint: all fixes applied', vim.log.levels.INFO)
                        end)
                    else
                        vim.schedule(function()
                            vim.notify('ESLint: fix-all failed', vim.log.levels.ERROR)
                        end)
                    end
                end,
            })
        end, {desc = 'ESLint: fix all issues in buffer'})
    end,
}

