vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = function(mode, lhs, rhs, opts)
	local options = { silent = true, noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

map("n", "<space>", "<nop>")

map("c", "%%", "getcmdtype() == ':' ? expand('%:h').'/' : '%%'", { silent = false, expr = true })

map("x", ">", ">gv")
map("x", "<", "<gv")

map("n", "<Esc>", "<Cmd>noh<CR><Esc>")
map("n", "<Esc>^[", "<Esc>^[")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("v", "/", [[<Esc>/\%V]], { silent = false })

map("n", "<Up>", "")
map("n", "<Down>", "")
map("n", "<Left>", "")
map("n", "<Right>", "")

map("n", "gb", "<Cmd>bn<CR>")
map("n", "gB", "<Cmd>bp<CR>")
map("n", "gt", "<Cmd>tabnext<CR>")
map("n", "gT", "<Cmd>tabprev<CR>")

map("n", "g-", "<cmd>:e .private/scratch.md<cr>")

map("t", "<Esc>", "<C-\\><C-n>")
