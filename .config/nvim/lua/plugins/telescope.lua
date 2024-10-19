return {
  "nvim-telescope/telescope.nvim",
  keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    {
      "<leader><leader>",
      function()
        require("telescope").extensions.smart_open.smart_open()
      end,
      desc = "Smart Find",
    },
  },
  -- change some options
  opts = function(_, opts)
    local actions = require("telescope.actions")
    opts.defaults.mappings = vim.tbl_extend("force", opts.defaults.mappings, {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-u>"] = actions.close,
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      },
    })
    opts.defaults.file_ignore_patterns = {
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
    }
  end,
}
