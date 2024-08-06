return {
  {
    "stevearc/conform.nvim",
    opts = {},
    keys = {
      {
        "<leader>cf",
      },
    },
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "prettier" },
          python = function(bufnr)
            if conform.get_formatter_info("ruff_format", bufnr).available then
              return { "ruff_format" }
            else
              return { "isort", "black" }
            end
          end,
          go = { "goimports", "gofmt" },
          rust = { "rustfmt" },
          c = { "clang_format" },
          cpp = { "clang_format" },
        },
        log_level = vim.log.levels.DEBUG,
      })
      vim.keymap.set({ "n" }, "<leader>cf", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end, { desc = "format file" })
    end,
  },
}
