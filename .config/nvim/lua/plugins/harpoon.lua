return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	requires = { { "nvim-lua/plenary.nvim" } },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():append()
			local path = vim.fn.expand("%")
			vim.notify('Added "' .. path .. '" to harpoon in position')
		end, { desc = "append file to harpoon list" })

		vim.keymap.set("n", "<leader>j", function()
			harpoon:list():clear()
			vim.notify("Cleared harpoon list")
		end, { desc = "clear harpoon list" })

		vim.keymap.set("n", "<leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "open harpoon quick menu" })

		for i = 1, 9, 1 do
			vim.keymap.set("n", "<leader>" .. i, function()
				harpoon:list():select(i)
			end, { desc = "harpoon option " .. i })
		end
	end,
}
