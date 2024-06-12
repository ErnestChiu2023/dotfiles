return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	commit = "e76cb03",
	requires = { { "nvim-lua/plenary.nvim" } },
	config = function()
		local harpoon = require("harpoon")
		local Job = require("plenary.job")

		local function get_os_command_output(cmd, cwd)
			if type(cmd) ~= "table" then
				return {}
			end
			local command = table.remove(cmd, 1)
			local stderr = {}
			local stdout, ret = Job:new({
				command = command,
				args = cmd,
				cwd = cwd,
				on_stderr = function(_, data)
					table.insert(stderr, data)
				end,
			}):sync()
			return stdout, ret, stderr
		end
		harpoon:setup({
			settings = {
				save_on_toggle = false,
				save_on_ui_close = false,
				key = function()
					local branch = get_os_command_output({
						"git",
						"rev-parse",
						"--abbrev-ref",
						"HEAD",
					})[1]

					if branch then
						return vim.loop.cwd() .. "-" .. branch
					else
						return vim.loop.cwd()
					end
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
				vim.keymap.set("n", "<C-i>", function()
					harpoon.ui:select_menu_item({ vsplit = true })
				end, { buffer = cx.bufnr })
				vim.keymap.set("n", "<C-v>", function()
					harpoon.ui:select_menu_item({ vsplit = true })
				end, { buffer = cx.bufnr })
			end,
		})
	end,
}
