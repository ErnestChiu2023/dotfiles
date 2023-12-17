vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.api.nvim_set_option("clipboard", "unnamed")
local keymap = vim.api.nvim_set_keymap
keymap("i", "jk", "<Esc>", {})
