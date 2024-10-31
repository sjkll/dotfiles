return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>/", "<cmd>Telescope live_grep<cr>" },
		{ "<leader><space>", "<cmd>Telescope find_files<cr>" },
		{ "<leader>b", "<cmd>Telescope buffers<cr>" },
		{ "<leader>d", "<cmd>Telescope diagnostics<cr>" },
		{ "gd", "<cmd>Telescope lsp_definitions<cr>" },
		{ "gr", "<cmd>Telescope lsp_references<cr>" },
		{ "gi", "<cmd>Telescope lsp_implementations<cr>" },
		{ "gD", "<cmd>Telescope lsp_type_definitions<cr>" },
	},
	config = function(_, opts)
		local ok, telescope = pcall(require, "telescope")
		if not ok then
			vim.notify("failed to load plugin: telescope", vim.log.levels.WARN)
		end

		telescope.setup({
			defaults = {
				mappings = {
					n = {
						["q"] = require("telescope.actions").close,
					},
					i = {
						["<M-d>"] = "delete_buffer",
					},
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
		})
	end,
}
