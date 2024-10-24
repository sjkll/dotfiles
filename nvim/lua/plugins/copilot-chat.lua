return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  dependencies = {
    { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
    { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
  },
  cmd = "CopilotChat",
  keys = {
    {
      "<leader>cc",
      function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          require("CopilotChat").ask(
            input,
            { selection = require("CopilotChat.select").visual or require("CopilotChat.select").buffer }
          )
        end
      end,
      mode = { "n", "v" },
    },
  },
  build = "make tiktoken", -- Only on MacOS or Linux
  opts = {
    debug = true,
    window = {
      layout = "float",
    },
  },
}
