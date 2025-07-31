return {
    'goolord/alpha-nvim',
    config = function ()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        local ascii_art = require("art.fr1")

        dashboard.section.buttons.val = {}

        dashboard.section.header.val = ascii_art

        -- dashboard.section.buttons.val = {
        --   dashboard.button("b", "λ  > Browse files", ":Yazi<CR>"),
        -- }

        alpha.setup(dashboard.opts)
    end
}
