return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	requires = { { "nvim-lua/plenary.nvim" } },
	config = function()
		local harpoon = require("harpoon")
		function get_git_branch()
			local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
			return branch ~= "" and branch or ""
		end
		harpoon:setup({
			settings = {
				save_on_toggle = false,
				save_on_ui_close = false,
				key = function()
					return vim.loop.cwd() .. get_git_branch()
				end,
			},
		})

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():append()
			local path = vim.fn.expand("%")
			vim.notify('Added "' .. path .. '" to harpoon')
		end, { desc = "append file to harpoon list" })

		vim.keymap.set("n", "<leader>cl", function()
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

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>j", function()
			harpoon:list():prev({ ui_nav_wrap = true })
		end)
		vim.keymap.set("n", "<leader>k", function()
			harpoon:list():next({ ui_nav_wrap = true })
		end)

		harpoon:extend({
			UI_CREATE = function(cx)
				vim.keymap.set("n", "<C-v>", function()
					harpoon.ui:select_menu_item({ vsplit = true })
				end, { buffer = cx.bufnr })
			end,
		})
	end,
}
