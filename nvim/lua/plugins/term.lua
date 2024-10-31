return {
	dir = "~/.config/nvim/lua/projects/term.lua",
	keys = {
		{ "<leader>tt", "<cmd>lua require('projects.term').toggle()<CR>" },
		{ "<leader>tv", "<cmd>lua require('projects.term').toggle_vertical()<CR>" },
		{ "<leader>tr", "<cmd>lua require('projects.term').repl()<CR>" },
		{ "<leader>ts", "<cmd>lua require('projects.term').sendline()<CR>" },
		{ "<leader>ts", "<cmd>lua require('projects.term').sendvisual()<CR>", mode = { "v" } },
	},
}
