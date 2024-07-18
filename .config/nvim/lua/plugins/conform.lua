return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ruby = {},
    },
  },
  keys = {
    {
      "<leader>cF",
      function()
        require("conform").format({ formatters = { "injected" }, timeout_ms = 10000 })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
}
