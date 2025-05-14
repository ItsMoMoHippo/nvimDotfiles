require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<leader>vs", ":vsplit<CR>", { silent = true, desc = "Splits make a vertical split" })
map("n", "<leader>vc", ":only<CR>", { silent = true, desc = "Splits close all extra splits" })
