require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
o.number = true
o.relativenumber = true

vim.diagnostic.config { virtual_text = false, virtual_lines = true }
