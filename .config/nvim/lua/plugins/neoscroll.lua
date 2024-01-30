return {
	"karb94/neoscroll.nvim",
	config = function()
		require("neoscroll").setup({})
		local t = {}
		-- Syntax: t[keys] = {function, {function arguments}}
		t["<C-i>"] = { "scroll", { "-vim.wo.scroll", "true", "150" } }
		t["<C-u>"] = { "scroll", { "vim.wo.scroll", "true", "150" } }
		t["zt"] = { "zt", { "250" } }
		t["zz"] = { "zz", { "250" } }
		t["zb"] = { "zb", { "250" } }

		require("neoscroll.config").set_mappings(t)
	end,
}
