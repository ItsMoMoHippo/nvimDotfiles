local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    go = { "gofumpt", "goimports" },
  },

  format_on_save = {
    enabled = true,
    pattern = {
      "*.lua",
      "*.go",
      "*.html",
      "*.tmpl",
    },
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
