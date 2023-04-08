--[[
################################################################################
# KEYMAPS -------------------------------------------------------------------- #
################################################################################
--]]
-- Set Vim Leader
vim.g.mapleader = " "

-- Move selected text in visual mode up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in place when doing some moves
vim.keymap.set("n", "J", "mzJ`z")       -- Appending next line to current one
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Scrolling half page down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Scrolling half page up
vim.keymap.set("n", "n", "nzzzv")       -- Finding next occurence of search
vim.keymap.set("n", "N", "Nzzzv")       -- Finding previous occurence of search

-- Navigate between splits
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Ctrl-a for whole buffer selection
vim.keymap.set("n", "<C-a>", "ggVG")

