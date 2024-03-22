return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
				file_ignore_patterns = {
					"node_modules/.*",
					"%.env",
					"yarn.lock",
					"package-lock.json",
					"lazy-lock.json",
					"init.sql",
					"target/.*",
					".git/.*",
					"tmp/.*",
					"storybook-static/.*",
					"%.dockerignore",
					"vendor/.*",
				},
			},
		})
		local builtin = require("telescope.builtin")
		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find using grep" })
		keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
		keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
		keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })
		keymap.set("n", "<leader>fc", builtin.commands, { desc = "Find commands" })
		keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume last find" })
		keymap.set("n", "<leader>fs", builtin.treesitter, { desc = "Find symbols" })
		keymap.set("n", "<leader>f/", builtin.current_buffer_fuzzy_find, { desc = "Find current buffer fuzzy find" })
		keymap.set("n", "<leader>fp", builtin.git_status, { desc = "Find git status" })
	end,
}
