local utils = require("utils")

local lsp_settings = {
  pyright = {}, -- python
  ruff_lsp = {}, -- python
  rust_analyzer = {}, -- rust
  gopls = {
    gofumpt = true,
    codelenses = {
      gc_details = false,
      generate = true,
      regenerate_cgo = true,
      run_govulncheck = true,
      test = true,
      tidy = true,
      upgrade_dependency = true,
      vendor = true,
    },
    hints = {
      assignVariableTypes = true,
      compositeLiteralFields = true,
      compositeLiteralTypes = true,
      constantValues = true,
      functionTypeParameters = true,
      parameterNames = true,
      rangeVariableTypes = true,
    },
    analyses = {
      fieldalignment = true,
      nilness = true,
      unusedparams = true,
      unusedwrite = true,
      useany = true,
    },
    usePlaceholders = true,
    completeUnimported = true,
    staticcheck = true,
    directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
    semanticTokens = true,
  }, -- go
  ts_ls = {
    completions = {
      completeFunctionCalls = true,
    },
  }, -- ts
  cssls = {}, -- xss
  volar = {}, -- vue
  lua_ls = { -- lua
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        checkThirdParty = false,
      },
    },
  },
}

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Diagnostics mappings
    utils.map("n", "<leader>co", function()
      vim.lsp.buf.code_action({
        apply = true,
        context = {
          only = { "source.organizeImports" },
          diagnostics = {},
        },
      })
    end)
    utils.map("n", "gd", require("telescope.builtin").lsp_definitions)
    utils.map("n", "gr", require("telescope.builtin").lsp_references)
    utils.map("n", "gi", require("telescope.builtin").lsp_implementations)
    utils.map("n", "gD", require("telescope.builtin").lsp_type_definitions)
    utils.map("n", "<leader>ca", vim.lsp.buf.code_action)
    utils.map("n", "<leader>cd", vim.diagnostic.open_float)
    utils.map("n", "<leader>cr", vim.lsp.buf.rename)
    utils.map("n", "K", vim.lsp.buf.hover)

  end,
})

return {
  {
    "neovim/nvim-lspconfig",
    -- This event will simply after starting mason and mason.lspconfig
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp = require("cmp_nvim_lsp")

      lspconfig.util.on_setup = lspconfig.util.add_hook_after(lspconfig.util.on_setup, function(config)
        config.capabilities = vim.tbl_deep_extend("force", config.capabilities, cmp.default_capabilities())

        config.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
        config.handlers["textDocument/signatureHelp"] =
          vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
      end)

      for server_name, config in pairs(lsp_settings) do
        lspconfig[server_name].setup({
          settings = config,
        })
      end
    end,
  },
  -- {"fatih/vim-go", config=true}
}
