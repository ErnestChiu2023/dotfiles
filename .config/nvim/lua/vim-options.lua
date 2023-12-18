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
