return {
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    keys = function(_, keys)
      local function toggleterm()
        local venv = vim.b["virtual_env"]
        local term = require("toggleterm.terminal").Terminal:new({
          env = venv and { VIRTUAL_ENV = venv } or nil,
          count = vim.v.count > 0 and vim.v.count or 1,
        })
        term:toggle()
      end
      local mappings = {
        { "<leader>t", mode = { "n", "t" }, toggleterm, desc = "Toggle Terminal" },
      }
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      open_mapping = false,
      float_opts = {
        border = "curved",
      },
    },
  },
}
