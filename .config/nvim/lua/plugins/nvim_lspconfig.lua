local lspconfig = require("lspconfig")

-- add tsserver and setup with typescript.nvim instead of lspconfig
return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      rubocop = {
        -- See: https://docs.rubocop.org/rubocop/usage/lsp.html
        cmd = { "bundle", "exec", "rubocop", "--lsp" },
        root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
      },
      vtsls = {
        settings = {
          typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            preferences = {
              importModuleSpecifier = "non-relative",
            },
          },
        },
      },
    },
    capabilities = {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    },
  },
}
