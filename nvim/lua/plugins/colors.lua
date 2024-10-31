return {
	{
		"dgox16/oldworld.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.opt.background = "light"
			vim.cmd("colo lunaperche")
		end,
	},
}
