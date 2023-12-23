local map = vim.keymap.set
local set = vim.opt
local defaults = { noremap = true, silent = true }

-- Save key strokes (now we do not need to press shift to enter command mode).
map({ "n", "x" }, ";", ":")

-- Easy escape
map("i", "jk", "<Esc>", {})

-- Shortcut for faster save and quit
map("n", "<leader>w", "<cmd>update<cr>", { silent = true, desc = "Save buffer" })

-- Saves the file if modified and quit
map("n", "<leader>q", "<cmd>x<cr>", { silent = true, desc = "Quit current window" })

-- Quit all opened buffers
map("n", "<leader>Q", "<cmd>qa!<cr>", { silent = true, desc = "Quit nvim" })

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

-- Center on page up/down
map("n", "<C-u>", "<C-u>zz>", defaults)
map("n", "<C-d>", "<C-d>zz>", defaults)

-- move current line / block with Alt-j/k similar to vscode.
map("n", "<A-j>", ":m .+1<cr>==")
map("n", "<A-k>", ":m .-2<cr>==")
map("x", "<A-j>", ":m '>+1<cr>gv=gv")
map("x", "<A-k>", ":m '<-2<cr>gv=gv")

-- Switch windows
map("n", "<C-h>", "<c-w>h")
map("n", "<C-l>", "<C-W>l")
map("n", "<C-k>", "<C-W>k")
map("n", "<C-j>", "<C-W>j")

-- clear highlighting
map("n", "<leader>ch", ":noh <cr>", { desc = "Clear highlighting" })

-- copy relative path
map("n", "<leader>crp", ":Cppath <cr>", { desc = "Copy relative path" })

-- do not clear register on paste
map("x", "p", "P")

-- don't move cursor when triggering asterick
map("n", "*", "*``")
