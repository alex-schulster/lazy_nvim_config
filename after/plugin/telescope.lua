--[[
################################################################################
# TELESCOPE CONFIG ----------------------------------------------------------- #
################################################################################
--]]

-- Shortcut `builtin` command
local builtin = require('telescope.builtin')

-- Set keymaps
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})	-- Find files
vim.keymap.set('n', '<leader>ft', builtin.live_grep, {})	-- Find text
