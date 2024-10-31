return {
	"stevearc/oil.nvim",
	cmd = "Oil",
	keys = {
		{ "-", "<cmd>Oil --float<cr>" },
	},
	config = function()
		local success, oil = pcall(require, "oil")
		if not success then
			vim.notify("failed to load plugin: oil", vim.log.levels.WARN)
			return
		end

		oil.setup({
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
				natural_order = true,
				is_always_hidden = function(name, _)
					return name == ".." or name == ".git"
				end,
			},
			float = {
				padding = 2,
				max_width = 90,
				max_height = 0,
			},
			win_options = {
				wrap = true,
				winblend = 0,
			},
			keymaps = {
				["<C-c>"] = false,
				["q"] = "actions.close",
			},
		})
	end,
}
