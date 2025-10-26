return {
  {
    "habamax/vim-habamax",
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd("colorscheme habamax")

      local aug = vim.api.nvim_create_augroup("HabamaxOverrides", {clear = true})
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = aug,
        callback = function()
          if vim.g.colors_name ~= "habamax" then return end

          -- softer reds / diagnostics
          vim.api.nvim_set_hl(0, "ErrorMsg",         {fg = "#d06060"})
          vim.api.nvim_set_hl(0, "NotifyERRORBorder",{fg = "#b68c52"})

          vim.api.nvim_set_hl(0, "Error",            {fg = "#d06060"})
          vim.api.nvim_set_hl(0, "DiagnosticError",  {fg = "#d06060"})
          vim.api.nvim_set_hl(0, "DiffDelete",       {fg = "#803333", bg = "NONE"})
          vim.api.nvim_set_hl(0, "SpellBad",         {sp = "#d06060", undercurl = true})
        end,
      })

      -- ensure overrides apply now (on startup)
      vim.cmd("doautocmd ColorScheme")
    end,
  },

  {
    "sainnhe/sonokai",
    init = function()
      vim.g.sonokai_style = "espresso"
      vim.g.sonokai_better_performance = 1
      vim.g.sonokai_dim_inactive_windows = 1
    end,
  },
}
