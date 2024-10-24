if true then
  return {}
end
return {
  "folke/trouble.nvim",
  opts = {},
  file = "qf",
  cmd = "Trouble",
  keys = {
    {
      "<leader>dl",
      "<cmd>Trouble diagnostics toggle<cr>",
    },
    {
      "<leader>dL",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    },
  },
}
