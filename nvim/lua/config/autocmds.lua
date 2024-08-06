local utils = require("utils")

local function augroup(name)
  return vim.api.nvim_create_augroup("custom" .. name, { clear = true })
end

-- Set english permanently
vim.cmd("lan en_US.UTF-8")

-- Remove trailing whitespaces on write
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("TrimWhitespace"),
  pattern = "*",
  callback = function()
    utils.trim_trailing_white_space()
  end,
  desc = "Remove trailing whitespace on write",
})

-- Enable spellcheck for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("SpellCheck"),
  pattern = { "text", "gitcommit", "markdown" },
  command = "setlocal spell wrap",
  desc = "Enable spellcheck for specific filetypes",
})

-- Enable highlighting when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("Highlight"),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = "Enable highlighting when yanking text",
})

-- A set of filetypes where just hitting "q" should exit the buffer/window
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("FasterQuit"),
  pattern = { "help", "man", "lspinfo", "startuptime", "spectre_panel", "qf", "vim", "netrw" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<Cmd>quit!<CR>", { silent = true, buffer = event.buf })
  end,
  desc = "A set of filetypes where just hitting 'q' should exit the buffer/window",
})

-- Toggle conceallevel on file open
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("ConcealToggle"),
  pattern = { "*" },
  command = "setlocal conceallevel=0",
  desc = "Automatic toggling of conceallevel when in insert/normal mode",
})

-- Disable auto insert of comment after <cr> or o O
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("Comments"),
  pattern = { "*" },
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "r", "o" }
  end,
})

-- Enable spellcheck for specific filetypes
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("SpellCheck"),
  pattern = { "text", "gitcommit", "markdown" },
  command = "setlocal spell wrap",
  desc = "Enable spellcheck for specific filetypes",
})

-- Indent by tab in files
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("ExpandTab"),
  pattern = { "bash", "go", "sh" },
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

-- Indent 2 spaces in files
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("ShiftWidth2"),
  pattern = { "lua", "javascript", "typescript" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("AutoCreateDir"),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Json format
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("JsonFormat"),
  pattern = { "json" },
  callback = function()
    utils.map("n", "<leader>cf", "<Cmd>%!jq<CR>")
  end,
})

-- Transparent
vim.api.nvim_create_autocmd("ColorScheme", {
  group = augroup("TransparentBackgroundColour"),
  callback = function()
    -- vim.cmd("hi normal guibg=none")
  end,
})

vim.api.nvim_create_user_command("Run", utils.Run, { nargs = "?", complete = "file" })
vim.api.nvim_create_user_command("LspEnableDiagnostic", utils.EnableDiagnostic, {})
vim.api.nvim_create_user_command("LspDisableDiagnostic", utils.DisableDiagnostic, {})
vim.api.nvim_create_user_command("Test", utils.Test, { nargs = "?", complete = "file" })
