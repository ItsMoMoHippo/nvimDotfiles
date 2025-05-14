require("render-markdown").setup {
  filetypes = { "markdown" },
  theme = "dark",
  width = 80,
}

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = { "*.md", "*.markdown" },
  callback = function()
    require("render-markdown").enable()
  end,
})

vim.keymap.set(
  "n",
  "<leader>rm",
  "<cmd>lua require('render-markdown').toggle()<CR>",
  { silent = true, desc = "render the markdownfile" }
)
