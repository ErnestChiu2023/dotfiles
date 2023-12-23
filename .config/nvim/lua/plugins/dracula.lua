return {
	"maxmx03/dracula.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local dracula = require("dracula")

		dracula.setup()

		vim.cmd.colorscheme("dracula")

		vim.cmd([[:highlight NeogitDiffAddHighlight guifg=#50fa7b guibg=#425246]])
		vim.cmd([[:highlight NeogitDiffAdd guifg=#50fa7b guibg=#425246]])
		vim.cmd([[:highlight NeogitDiffDeleteHighlight guifg=#ff5555 guibg=#5e4141]])
		vim.cmd([[:highlight NeogitDiffDelete guifg=#ff5555 guibg=#5e4141]])

		vim.cmd([[:highlight DiffviewStatusAdded guifg=#50fa7b guibg=#425246]])
		vim.cmd([[:highlight DiffviewStatusDeleted guifg=#ff5555 guibg=#5e4141]])

		vim.cmd([[:highlight DiffviewDiffAdd guifg=#50fa7b guibg=#425246]])
		vim.cmd([[:highlight DiffviewDiffDelete guifg=#ff5555 guibg=#5e4141]])
	end,
}
