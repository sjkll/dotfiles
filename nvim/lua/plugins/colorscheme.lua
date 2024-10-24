local theme = "zaibatsu"

if theme == "zaibatsu" then
  vim.cmd("colo zaibatsu")
end

return {
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      if theme == "kanagawa" then
        vim.cmd("colo kanagawa-wave")
      end
    end,
  },
  {
    "rose-pine/neovim",
    lazy = true,
    priority = 1000,
    config = function()
      if theme == "rose-pine" then
        vim.cmd("colo rose-pine-moon")
      end
    end,
  },
  {
    "ribru17/bamboo.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      if theme == "bamboo" then
        vim.cmd("colo bamboo")
      end
    end,
  },
  {
    "tanvirtin/monokai.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      if theme == "monokai" then
        vim.cmd("colo monokai")
      end
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    ft = {
      "lua",
      "css",
      "toml",
      "javascript",
    },
    config = function()
      require("colorizer").setup({
        "lua",
        "css",
        "toml",
        "javascript",
      })
    end,
  },
}
