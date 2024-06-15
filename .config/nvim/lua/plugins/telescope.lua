return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			pickers = {
				find_files = {
					hidden = true,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
			defaults = {
				vimgrep_arguments = {
					"rg",
					"-L",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				file_sorter = require("telescope.sorters").get_fuzzy_file,
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				winblend = 0,
				border = {},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				color_devicons = true,
				set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				-- Developer configurations: Not meant for general override
				buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,

				-- regular config
				path_display = { "truncate" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
						["<C-i>"] = actions.select_vertical,
						["<C-u>"] = actions.close,
						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
						-- ["<C-m>"] = actions.preview_scrolling_up,
						-- ["<C-n>"] = actions.preview_scrolling_down,
						-- ["<CR>"] = actions.select_default,
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

		-- load telescope fzf extension
		telescope.load_extension("fzf")

		local builtin = require("telescope.builtin")
		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find text in all files" })
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
