local M = {}

init = function()
  -- package manager
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
end

init()

require("lazy").setup("plugins", {
  ui = {
    icons = {
      cmd = "cmd:",
      config = "config:",
      event = "event:",
      ft = "ft:",
      init = "init:",
      import = "import:",
      keys = "keys:",
      lazy = "lazy:",
      loaded = "●",
      not_loaded = "○",
      plugin = "plugin:",
      runtime = "runtime:",
      require = "require:",
      source = "source:",
      start = "start:",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
  },
  install = {
    missing = true,
  },
  change_direction = {
    enable = true,
    notify = false,
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        "osc52",
        "parser",
        "gzip",
        "netrwPlugin",
        "health",
        "man",
        "matchit",
        -- "rplugin",
        "matchparen",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

return M
