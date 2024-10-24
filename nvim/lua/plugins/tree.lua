return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  keys = {
    {
      "<leader>e",
      function()
        local api = require("nvim-tree.api")
        api.tree.toggle({ focus = true, find_file = true })
      end,
      { noremap = true, silent = true },
    },
  },
  config = true,
}
