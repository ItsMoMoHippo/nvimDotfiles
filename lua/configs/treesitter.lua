require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "c",
    "go",
    "templ",
    "lua",
    "luadoc",
    "vim",
    "vimdoc",
    "markdown",
    "markdown_inline",
    "html",
    "bash",
  },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}
