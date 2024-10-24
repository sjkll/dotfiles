local opt = vim.opt
local fn = vim.fn
local g = vim.g

g.mapleader = " "
g.maplocalleader = "\\"

fn.nobackup = true
fn.nowritebackup = true
fn.noswapfile = true
opt.updatetime = 1000 -- Save swap file and trigger CursorHold

-- UI
opt.confirm = false -- Confirm to save changes before exiting modified buffer
opt.laststatus = 2 -- statusline all windows, set 3 for only one
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend (opacity)
-- opt.pumheight = 6 -- Maximum number of entries in a popup
opt.sidescrolloff = 8 -- Columns of context
opt.shortmess:append({ W = true, A = true, I = true, c = true, C = true })
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.showmode = false -- Dont show mode since we have a atusline
opt.termguicolors = true -- True color support
opt.spelllang = "en,ru"
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.showtabline = 2

-- Menus
opt.completeopt = "menuone,noselect,noinsert"
opt.wildmode = "longest:full,longest" -- Command-line completion mode

-- Indent
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Insert indents automatically

-- Search
opt.ignorecase = true -- Ignore case
opt.tabstop = 4 -- Number of spaces tabs count for
opt.shiftwidth = 4 -- Size of an indent
opt.shiftround = true -- Round indent
opt.smartcase = true -- Don't ignore case with capitals

-- Split
opt.splitkeep = "cursor"
opt.splitbelow = true -- Put new windows below curren
opt.splitright = true -- Put new windows right of current

-- Undo
opt.undofile = true
opt.undolevels = 10000

-- List
opt.list = true -- Show some invisible characters (tabs...
opt.listchars = {
  tab = "> ",
  trail = "·",
  nbsp = "·",
}

-- Fix markdown indentation settings
g.markdown_recommended_style = 0
