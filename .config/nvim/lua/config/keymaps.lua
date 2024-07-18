-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local unmap = vim.keymap.del
local defaults = { noremap = true, silent = true }

-- Save key strokes (now we do not need to press shift to enter command mode).
map({ "n", "x" }, ";", ":")
map({ "n", "x" }, "C-;", ";")

-- Easy escape
map("i", "jk", "<Esc>", {})

-- force quit all
map("n", "<leader>qa", "<cmd>qa!<cr>", { desc = "Force Quit All" })

-- Center on page up/down
map("n", "<C-k>", "<C-u>zz", defaults)
map("n", "<C-j>", "<C-d>zz", defaults)

-- copy relative path
map("n", "<leader>crp", ":Cppath <cr>", { desc = "Copy relative path" })
map("n", "<leader>crn", ":Cppathwithline <cr>", { desc = "Copy relative path with line number" })

-- do not clear register on paste
map("x", "p", "P")

-- don't move cursor when triggering asterick
map("n", "*", "*``")
map("n", ",", "@@")

-- unmap lazygit commands
unmap("n", "<leader>gg")
unmap("n", "<leader>gG")
unmap("n", "<leader>gb")
unmap("n", "<leader>gB")
unmap("n", "<leader>gf")
unmap("n", "<leader>gl")
unmap("n", "<leader>gL")
