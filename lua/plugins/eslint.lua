return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
    -- after your lint.try_lint() keymap:
    vim.keymap.set("n", "<leader>f", function()
      -- save the file first
      vim.cmd("write")

      local buf = vim.api.nvim_get_current_buf()
      local file = vim.api.nvim_buf_get_name(buf)

      -- run eslint_d --fix asynchronously
      vim.fn.jobstart({ "eslint_d", "--fix", file }, {
        stdout_buffered = true,
        stderr_buffered = true,
        on_exit = function(_, code, _)
          if code == 0 then
            -- reload the buffer to pick up fixes
            vim.schedule(function()
              vim.cmd("edit!")
              vim.notify("ESLint: all fixes applied", vim.log.levels.INFO)
            end)
          else
            vim.schedule(function()
              vim.notify("ESLint: fix-all failed", vim.log.levels.ERROR)
            end)
          end
        end,
      })
    end, { desc = "ESLint: fix all issues in buffer" })
  end,
}

