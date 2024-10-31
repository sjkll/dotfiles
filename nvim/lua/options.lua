local o = vim.opt

o.mouse = ""
o.showtabline = 1

o.wrap = true

o.splitbelow = true
o.splitright = true

o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4

o.number = true
o.relativenumber = true
o.numberwidth = 3

o.foldlevelstart = 99
o.foldtext = ""

o.smartindent = true

o.ignorecase = true
o.smartcase = true

o.backup = false
o.swapfile = false

o.undofile = true
o.undolevels = 10000

o.fileencoding = "utf-8"

o.list = true
o.listchars = {
	tab = "> ",
	leadmultispace = "|   ",
	lead = "·",
	trail = "·",
	nbsp = "·",
}

o.completeopt = "menuone,noselect,noinsert"
o.wildmode = "longest:full,longest"

o.signcolumn = "yes"

o.cursorline = true
