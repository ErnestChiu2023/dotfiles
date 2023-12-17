
local map = vim.keymap.set
local set = vim.opt
local defaults = { noremap = true, silent = true }

-- Save key strokes (now we do not need to press shift to enter command mode).
map({ "n", "x" }, ";", ":")

-- Easy escape
map('i', 'jk', '<Esc>', {})

-- Shortcut for faster save and quit
map("n", "<leader>w", "<cmd>update<cr>", { silent = true, desc = "save buffer" })

-- Saves the file if modified and quit
map("n", "<leader>q", "<cmd>x<cr>", { silent = true, desc = "quit current window" })

-- Quit all opened buffers
map("n", "<leader>Q", "<cmd>qa!<cr>", { silent = true, desc = "quit nvim" })

map({ "n", "x" }, "H", "^")
map({ "n", "x" }, "L", "g_")

-- Continuous visual shifting (does not exit Visual mode), `gv` means
-- to reselect previous visual area, see https://superuser.com/q/310417/736190
map("x", "<", "<gv", defaults)
map("x", ">", ">gv", defaults)

-- Edit and reload nvim config file quickly
map("n", "<leader>rev", "<cmd>tabnew $MYVIMRC <bar> tcd %:h<cr>", {
  silent = true,
  desc = "open init.lua",
})
