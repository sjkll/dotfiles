if true then
  return {}
end
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
    {
      "<leader>tx",
      function()
        local cmd
        local float_term = require("toggleterm.terminal").Terminal:new({ direction = "float", close_on_exit = true })
        print(vim.fn.mode())
        if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
          local start_pos = vim.fn.getpos("'<")
          local end_pos = vim.fn.getpos("'>")
          local lines = vim.fn.getline(start_pos[2], end_pos[2])
          cmd = table.concat(lines, "\n")
        else
          cmd = vim.fn.getline(".")
        end
        float_term:toggle()
        float_term:send(cmd, false)
      end,
      mode = { "n", "v" },
      desc = "Execute Command Under Cursor",
    },
  },
  opts = {
    direction = "float",
    shell = "fish",
    close_on_exit = true,
    auto_scroll = true,
  },
}
