local lsp_settings = {
	pyright = {}, -- python
	ruff_lsp = {}, -- python
	rust_analyzer = {}, -- rust
	gopls = {}, -- go
	ts_ls = {}, -- ts
	volar = {}, -- vue
	lua_ls = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
}

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Diagnostics mappings
		vim.keymap.set("n", "<leader>co", function()
			vim.lsp.buf.code_action({
				apply = true,
				context = {
					only = { "source.organizeImports" },
					diagnostics = {},
				},
			})
		end)

		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
		vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float)
		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename)
		vim.keymap.set("n", "K", vim.lsp.buf.hover)
	end,
})

return {
	{
		"neovim/nvim-lspconfig",
		-- This event will simply after starting mason and mason.lspconfig
		ft = { "python", "rust", "go", "ts", "js", "vue", "lua" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local cmp = require("cmp_nvim_lsp")

			lspconfig.util.on_setup = lspconfig.util.add_hook_after(lspconfig.util.on_setup, function(config)
				config.capabilities = vim.tbl_deep_extend("force", config.capabilities, cmp.default_capabilities())

				vim.opt["linebreak"] = true
				vim.opt["whichwrap"] = "bs<>[]hl"

				vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
					title = "LSP",
					border = "single",
					wrap = true,
					wrap_at = 80,
					focus = true,
				})

				vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
					title = "LSP",
					border = "single",
					wrap = true,
					wrap_at = 80,
					focusable = true,
				})
			end)

			for server_name, config in pairs(lsp_settings) do
				lspconfig[server_name].setup({
					settings = config,
				})
			end
		end,
	},
}
