return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim",
  },
  cmd = "Neogit",
  keys = { { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit" } },
  config = function()
    local neogit = require("neogit")
    neogit.setup({
      disable_line_numbers = false,
      commit_editor = {
        kind = "tab",
        show_staged_diff = true,
        -- Accepted values:
        -- "split" to show the staged diff below the commit editor
        -- "vsplit" to show it to the right
        -- "split_above" Like :top split
        -- "vsplit_left" like :vsplit, but open to the left
        -- "auto" "vsplit" if window would have 80 cols, otherwise "split"
        staged_diff_split_kind = "vsplit",
      },
      integrations = {
        -- If enabled, use telescope for menu selection rather than vim.ui.select.
        -- Allows multi-select and some things that vim.ui.select doesn't.
        telescope = false,
        -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `diffview`.
        -- The diffview integration enables the diff popup.
        --
        -- Requires you to have `sindrets/diffview.nvim` installed.
        diffview = true,
      },
      git_services = {
        ["github.com"] = "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1",
      },
      ignored_settings = {
        "NeogitPushPopup--force",
        "NeogitPullPopup--rebase",
        "NeogitCommitPopup--allow-empty",
        "NeogitRevertPopup--no-edit",
      },
    })
  end,
}
