return {
  -- auto completion
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      {
        "zbirenbaum/copilot-cmp",
        dependencies = "copilot.lua",
        opts = {},
        config = function(_, opts)
          local copilot_cmp = require("copilot_cmp")
          copilot_cmp.setup(opts)

          local lspconfig = require("lspconfig")
          lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
            on_attach = function(client, bufnr)
              if client.name == "copilot" then
                copilot_cmp._on_insert_enter({})
              end
            end,
          })
        end,
      },
    },
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()

      return {
        completion = {
          autocomplete = false,
        },
        sources = cmp.config.sources({
          {
            name = "copilot",
            group_index = 1,
            priority = 100,
          },
          { name = "nvim_lsp" },
          { name = "path" },
          {
            name = "buffer",
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end,
            },
          },
        }),
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        sorting = defaults.sorting,
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
          ["<Down>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
          ["<Up>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
        }),
      }
    end,
  },
}
