-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

-- easy escape
local keymap = vim.api.nvim_set_keymap
keymap("i", "jk", "<Esc>", {})

-- copy relative path with line number
vim.api.nvim_create_user_command("Cppathwithline", function()
  local line = vim.fn.line(".")
  local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
  local path_and_line = path .. ":" .. line
  vim.fn.setreg("+", path_and_line)
  vim.notify('Copied "' .. path_and_line .. '" to the clipboard!')
end, {})

-- copy relative path
vim.api.nvim_create_user_command("Cppath", function()
  local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

-- faster lua loading
vim.loader.enable()

-- disable trouble in lualine
vim.g.trouble_lualine = false
-- disable lazy git
vim.g.lazygit_config = false
vim.g.hidden = false

local opt = vim.opt

opt.confirm = false
opt.splitright = true
