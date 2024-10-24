return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-ui-select.nvim" },
  },
  keys = {
    { "<leader>/", "<cmd>Telescope live_grep<cr>" },
    { "<leader><space>", "<cmd>Telescope find_files<cr>" },
    { "<leader>b", "<cmd>Telescope buffers<cr>" },
  },
  opts = {
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({}),
      },
    },
    defaults = {
      multi_icon = "",
      layout_strategy = "flex",
      scroll_strategy = "cycle",
      selection_strategy = "reset",
      winblend = 0,
      layout_config = {
        vertical = {
          mirror = true,
        },
        center = {
          mirror = true,
        },
      },
      hl_result_eol = false,
      preview = {
        msg_bg_fillchar = " ",
      },
      history = {
        cycle_wrap = true,
      },
      cache = false,
      mappings = {
        i = {},
        n = {
          ["q"] = require("telescope.actions").close,
        },
      },
    },
    pickers = {
      colorscheme = {
        enable_preview = true,
      },
      find_files = {
        theme = "dropdown",
        previewer = false,
        layout_config = {
          center = {
            width = 120,
          },
        },
      },
      git_files = {
        theme = "dropdown",
        previewer = false,
      },
      buffers = {
        sort_mru = true,
        theme = "dropdown",
        previewer = false,
        mappings = {
          i = { ["<c-d>"] = require("telescope.actions").delete_buffer },
        },
      },
      man_pages = { sections = { "2", "3" } },
      lsp_references = { path_display = { "shorten" } },
      lsp_code_actions = { theme = "dropdown" },
      current_buffer_fuzzy_find = { theme = "dropdown" },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("ui-select")
  end,
}
