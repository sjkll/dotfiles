return {
  "lewis6991/gitsigns.nvim",
  opts = {
    attach_to_untracked = true,
    current_line_blame = true,
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")
      local utils = require("utils")

      utils.map("n", "gh", function()
        if vim.wo.diff then
          vim.cmd.normal({ "gh", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end)

      utils.map("n", "gH", function()
        if vim.wo.diff then
          vim.cmd.normal({ "gh", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end)

      utils.map("n", "<leader>hp", gitsigns.preview_hunk)
      utils.map("n", "<leader>hd", gitsigns.diffthis)
      utils.map("n", "<leader>hD", function()
        gitsigns.diffthis("~")
      end)
    end,
  },
}
