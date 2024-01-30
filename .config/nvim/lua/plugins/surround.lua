return {
	"kylechui/nvim-surround",
	version = "703ec63", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",

	config = function()
		require("nvim-surround").setup({
			-- Configuration here, or leave empty to use defaults
			keymaps = {
				insert = false,
				insert_line = false,
				normal = "ys",
				normal_cur = "yss",
				normal_line = "yS",
				normal_cur_line = "ySS",
				visual = "gS",
				visual_line = false,
				delete = "ds",
				change = "cs",
				change_line = "cS",
			},
		})
	end,
}
