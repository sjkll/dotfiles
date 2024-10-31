return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/playground",
	},
	event = "UIEnter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	config = function()
		local success, treesitter = pcall(require, "nvim-treesitter.configs")
		if not success then
			vim.notify("Failed to load plugin: treesitter")
			return
		end

		treesitter.setup({

			ensure_installed = { "lua", "python" },
			sync_install = true,
			ignore_install = {},
			highlight = {
				enable = true,
				disable = function(_, bufnr)
					return vim.api.nvim_buf_line_count(bufnr) > 500
				end,
			},
			indent = { enable = true },
			fold = { enable = true },
		})

		vim.opt["foldmethod"] = "expr"
		vim.opt["foldexpr"] = "nvim_treesitter#foldexpr()"
	end,
}
