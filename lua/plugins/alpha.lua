return {
    'goolord/alpha-nvim',
    config = function ()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')

        local pics = {
            require('art.fr1'),
            require('art.neko'),
            require('art.brand')
        }

        dashboard.section.header.val = pics[math.random(1, #pics)]

        dashboard.section.buttons.val = {}

        alpha.setup(dashboard.opts)
    end
}
