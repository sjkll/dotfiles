return {
	{
		"stevearc/conform.nvim",
		opts = {},
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({
						lsp_fallback = true,
						async = false,
						timeout_ms = 700,
					})
				end,
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
					json = { "jq" },
				},
				log_level = vim.log.levels.DEBUG,
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function()
					require("conform").format()
				end,
			})
		end,
	},
}
