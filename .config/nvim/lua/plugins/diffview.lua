return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
	cmd = {
		"DiffviewOpen",
		"DiffviewClose",
		"DiffviewToggleFiles",
		"DiffviewFocusFiles",
		"DiffviewRefresh",
		"DiffviewFileHistory",
	},
	keys = {
		{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
		{ "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview Filehistory Open" },
	},
	config = function()
		require("diffview").setup({
			file_panel = { win_config = { height = 10, position = "bottom" } },
		})
	end,
}
