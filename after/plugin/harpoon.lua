--[[
################################################################################
# HARPOON CONFIG ------------------------------------------------------------- #
################################################################################
--]]

-- Load harpoon functions
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- Create keybindings
vim.keymap.set("n", "<leader>aa", mark.add_file)
vim.keymap.set("n", "<leader>am", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>ah", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>aj", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>ak", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>al", function() ui.nav_file(4) end)
