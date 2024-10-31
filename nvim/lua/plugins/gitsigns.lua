return {
	"lewis6991/gitsigns.nvim",
	cmd = "Gitsigns",
	event = "UIEnter",
	keys = {
		{ "]h", "<cmd>Gitsigns next_hunk<cr>" },
		{ "[H", "<cmd>Gitsigns preview_hunk<cr>" },
		{ "<leader>hp", "<cmd>Gitsigns preview_hunk<cr>" },
		{ "<leader>hd", "<cmd>Gitsigns diffthis<cr>" },
	},
	config = function()
		local success, gitsigns = pcall(require, "gitsigns")
		if not success then
			vim.notify("failed to load plugin: gitsigns", vim.log.levels.WARN)
			return
		end

		gitsigns.setup({
			attach_to_untracked = true,
			current_line_blame = true,
		})
	end,
}
