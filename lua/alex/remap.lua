--[[
################################################################################
# KEYMAPS -------------------------------------------------------------------- #
################################################################################
--]]
-- Set Vim Leader
vim.g.mapleader = " "

-- Launch Lazy Vim
vim.keymap.set("n", "<leader>l", vim.cmd.Lazy)

-- Move selected text in visual mode up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in place when doing some moves
vim.keymap.set("n", "J", "mzJ`z")       -- Appending next line to current one
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Scrolling half page down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Scrolling half page up
vim.keymap.set("n", "n", "nzzzv")       -- Finding next occurence of search
vim.keymap.set("n", "N", "Nzzzv")       -- Finding previous occurence of search

-- Quick actions for better yank / paste
vim.keymap.set("x", "<leader>p", [["_dP]])       -- Paste without yanking deletion
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- Yank in systemp clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])        -- Same
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- Delete in void register

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Navigate between splits
vim.keymap.set("n", "<C-h>", "<C-w>h");
vim.keymap.set("n", "<C-j>", "<C-w>j");
vim.keymap.set("n", "<C-k>", "<C-w>k");
vim.keymap.set("n", "<C-l>", "<C-w>l");
