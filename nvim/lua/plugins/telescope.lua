return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>/", "<cmd>Telescope live_grep<cr>" },
    { "<leader><space>", "<cmd>Telescope find_files<cr>" },
  },
  opts = function()
    return {
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
      },
    }
  end,
}
