-- tabbing
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- replace leader key
vim.g.mapleader = " "

-- show line numbers
vim.wo.number = true

-- local clipboard
vim.api.nvim_set_option("clipboard", "unnamed")

-- easy escape
local keymap = vim.api.nvim_set_keymap
keymap("i", "jk", "<Esc>", {})

-- copy relative path with line number
vim.api.nvim_create_user_command("Cppath", function()
	local line = vim.fn.line(".")
	local path = vim.fn.expand("%")
	local path_and_line = path .. ":" .. line
	vim.fn.setreg("+", path_and_line)
	vim.notify('Copied "' .. path_and_line .. '" to the clipboard!')
end, {})

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
