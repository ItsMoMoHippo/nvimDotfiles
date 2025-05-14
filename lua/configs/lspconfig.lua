require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"

local servers = {
  --web
  "html",
  "cssls",
  "templ",
  "ts_ls",
  --GC
  "gopls",
  "jdtls",
  --LowLevel
  "clangd",
  "rust_analyzer",
  "zls",
  "ols",
  --Other
  "neocmakelsp",
  "bashls",
}
local nvlsp = require "nvchad.configs.lspconfig"
vim.lsp.config.gopls = {
  settings = {
    gopls = {
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
}
vim.lsp.config.clangd = {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--clang-tidy-checks=*,-modernize-use-trailing-return-type",
    "--header-insertion=never",
  },
}
lspconfig.tailwindcss.setup {
  init_options = {
    userLanguages = {
      templ = "html",
    },
  },
}
lspconfig.bashls.setup {}
lspconfig.htmx.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  root_dir = function()
    return vim.loop.cwd()
  end,
}
vim.lsp.enable(servers)
