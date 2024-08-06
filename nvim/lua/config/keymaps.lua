local utils = require("utils")

-- utils.cowboy()
-- Unbind leader key
utils.map("n", "<space>", "<nop>")

-- Typing %% on the command line will expand to active buffer's path
utils.map("c", "%%", "getcmdtype() == ':' ? expand('%:h').'/' : '%%'", { silent = false, expr = true })

-- Keep Visual mode selection when indenting text
utils.map("x", ">", ">gv")
utils.map("x", "<", "<gv")

-- Clear highlighting with escape when in normal mode
-- https://stackoverflow.com/a/1037182/6654329
utils.map("n", "<Esc>", "<Cmd>noh<CR><Esc>")
utils.map("n", "<Esc>^[", "<Esc>^[")

-- Make `n|N` to also center the screen and open any folds
utils.map("n", "n", "nzzzv")
utils.map("n", "N", "Nzzzv")

-- Search in the visual selected area
utils.map("v", "/", [[<Esc>/\%V]], { silent = false, desc = "Search withing visual selected area" })

utils.map("n", "<Up>", "")
utils.map("n", "<Down>", "")
utils.map("n", "<Left>", "")
utils.map("n", "<Right>", "")

utils.map("n", "gb", "<Cmd>bn<CR>")
utils.map("n", "gB", "<Cmd>bp<CR>")

utils.map("n", "gx", utils.OpenLinkUnderCursor)

utils.map("n", "<leader>t", function()
  utils.Test({})
end)
