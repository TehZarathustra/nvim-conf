local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath})
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            {'Failed to clone lazy.nvim:\n', 'ErrorMsg'},
            {out, 'WarningMsg'},
            {'\nPress any key to exit...'},
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- setup lazy.nvim
require('lazy').setup({
    spec = {{import = 'plugins'}},
    install = {colorscheme = {'habamax'}},
    checker = {enabled = true},
})

-- run an update once on VimEnter, silently
-- works great, reduces noise
vim.api.nvim_create_autocmd('VimEnter', {
    once = true,
    callback = function()
        vim.schedule(function()
            local ok, lazy = pcall(require, 'lazy')
            if not ok or not lazy.update then
                return
            end
            -- perform update without showing the UI
            pcall(function()
                lazy.update({show = false})
            end)
        end)
    end,
})
