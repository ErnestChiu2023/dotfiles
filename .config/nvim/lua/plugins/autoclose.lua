return {
	"m4xshen/autoclose.nvim",
	lazy = false,
	config = function()
		local autoclose = require("autoclose")
		autoclose.setup()
	end,
}
