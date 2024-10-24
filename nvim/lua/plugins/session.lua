if true then
  return {}
end

return {
  "rmagatti/auto-session",
  keys = {
    { "<leader>wr", "<cmd>SessionSearch<CR>", desc = "Session search" },
    { "<leader>ws", "<cmd>SessionSave<CR>", desc = "Save session" },
  },
  config = function()
    require("auto-session").setup({
      log_level = "error",
      auto_session_suppress_dirs = {
        "~/",
        "~/Downloads",
        "~/Documents",
        "~/Repos",
      },
      auto_session_use_git_branch = true,
      auto_save = false,
      auto_restore = false,
      auto_create = false,
      session_lens = {
        load_on_setup = true,
        previewer = false,
        mappings = {
          delete_session = { "i", "<C-D>" },
          alternate_session = { "i", "<C-S>" },
          copy_session = { "i", "<C-Y>" },
        },
        theme_conf = {
          border = true,
        },
      },
      pre_save_cmds = {
        function()
          local status_ok, api = pcall(require, "nvim-tree.api")
          if not status_ok then
            return
          end
          api.tree.close()
        end,
      },
      post_save_cmds = {
        function()
          local status_ok, api = pcall(require, "nvim-tree.api")
          if not status_ok then
            return
          end
          api.tree.toggle({ focus = false, find_file = true })
        end,
      },

      post_restore_cmds = {
        function()
          local status_ok, api = pcall(require, "nvim-tree.api")
          if not status_ok then
            return
          end
          api.tree.toggle({ focus = false, find_file = true })
        end,
      },
    })
  end,
}
