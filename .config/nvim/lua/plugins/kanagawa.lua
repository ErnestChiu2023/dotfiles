return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup({
			compile = false, -- enable compiling the colorscheme
			undercurl = true, -- enable undercurls
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = false, -- do not set background color
			dimInactive = false, -- dim inactive window `:h hl-NormalNC`
			terminalColors = true, -- define vim.g.terminal_color_{0,17}
			colors = { -- add/modify theme and palette colors
				palette = {},
				theme = {
					wave = {},
					lotus = {},
					dragon = {},
					all = {
						ui = {
							bg_gutter = "none",
						},
					},
				},
			},
			overrides = function(colors) -- add/modify highlights
				local theme = colors.theme
				local palette = colors.palette

				return {
					FloatBorder = { bg = "none" },
					NormalFloat = { bg = "none" },
					FloatTitle = { bg = "none" },
					Pmenu = { bg = "none" },
					-- leap.nvim
					LeapBackdrop = { fg = palette.fujiGray },
					LeapLabelPrimary = { bold = true, fg = palette.carpYellow },
					LeapLabelSecondary = { bold = true, fg = palette.springBlue },
					LeapMatch = { bg = colors.bg_search, bold = true, fg = theme.ui.fg },
					-- cmp
					-- CmpCompletion = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
					-- CmpCompletionSel = { fg = "none", bg = theme.ui.bg_p2 },
					-- CmpCompletionThumb = { bg = theme.ui.bg_p2 },
					-- CmpCompletionSbar = { bg = theme.ui.bg_m1 },
				}
			end,
			theme = "wave", -- Load "wave" theme when 'background' option is not set
			background = { -- map the value of 'background' option to a theme
				dark = "wave", -- try "dragon" !
				light = "lotus",
			},
		})

		vim.cmd("colorscheme kanagawa")
	end,
}
