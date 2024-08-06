return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      enabled = vim.fn.executable("make") == 1,
    },
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<leader>b",
      "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
    },
    { "<leader>/", "<cmd>Telescope live_grep<cr>" },
    { "<leader><space>", "<cmd>Telescope find_files<cr>" },
  },
  opts = function()
    require("telescope").load_extension("fzf")
    return {
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
      },
    }
  end,
}
