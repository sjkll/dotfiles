if true then
  return {}
end
return {
  "stevearc/quicker.nvim",
  ft = "qf",
  opts = {
    keys = {
      { "rr", "<cmd>lua require('quicker').refresh()<CR>", desc = "Expand quickfix content" },
    },
  },
  config = function(_, opts)
    require("quicker").setup(opts)
  end,
}
