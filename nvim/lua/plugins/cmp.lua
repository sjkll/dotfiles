return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"zbirenbaum/copilot-cmp",
			dependencies = {
				"zbirenbaum/copilot.lua",
				opts = {
					suggestion = { enabled = false },
					panel = { enabled = false },
				},
			},
			opts = {},
			config = function(_, opts)
				local copilot_cmp = require("copilot_cmp")
				copilot_cmp.setup(opts)
			end,
		},
	},
	config = function()
		vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

		local success, cmp = pcall(require, "cmp")
		if not success then
			vim.notify("Failed to load plugin: cmp")
			return
		end
		cmp.setup({
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered({
					border = "single",
					max_width = 40,
					max_height = 12,
					scrollbar = true,
				}),
				documentation = cmp.config.window.bordered({
					border = "single",
					max_width = 80,

					max_height = 44,
				}),
			},
			mapping = {
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-k>"] = cmp.mapping(function(fallback)
					if cmp.visible_docs() then
						cmp.close_docs()
					elseif cmp.visible() then
						cmp.open_docs()
					else
						fallback()
					end
				end),
				["<c-n>"] = cmp.mapping(
					cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					{ "i" }
				),
				["<c-p>"] = cmp.mapping(
					cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					{ "i" }
				),
				["<Up>"] = cmp.mapping(function(fallback)
					cmp.abort()
					fallback()
				end),
				["<Down>"] = cmp.mapping(function(fallback)
					cmp.abort()
					fallback()
				end),
			},
			-- formatting = {
			-- 	fields = { "abbr", "menu" },
			-- 	format = function(entry, vim_item)
			-- 		vim_item.menu = ({
			-- 			nvim_lsp = "lsp",
			-- 			buffer = "buff",
			-- 			path = "path",
			-- 			copilot = "",
			-- 		})[entry.source.name]
			-- 		return vim_item
			-- 	end,
			-- },
			sources = {
				{
					name = "copilot",
					group_index = 2,
					priority = 100,
				},
				{ name = "nvim_lsp", group_index = 2 },
				{ name = "path", group_index = 2 },
				{
					name = "buffer",
					group_index = 3,
					option = {
						get_bufnrs = function()
							return vim.api.nvim_list_bufs()
						end,
					},
				},
			},
			experimental = {
				ghost_text = false,
				native_menu = false,
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
				autocomplete = false,
			},
			view = {
				-- entries = "native",
				docs = { auto_open = true },
			},
		})
	end,
}
