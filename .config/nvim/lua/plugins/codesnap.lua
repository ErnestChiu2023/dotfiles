return {
	"mistricky/codesnap.nvim",
	build = "make",
	event = "VeryLazy",
	lazy = true,
	opts = {
		save_path = "~/Pictures",
		has_breadcrumbs = true,
		has_line_number = true,
		watermark = "",
	},
}
