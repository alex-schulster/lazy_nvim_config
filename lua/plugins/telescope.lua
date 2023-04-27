--[[
################################################################################
# TELESCOPE CONFIG ----------------------------------------------------------- #
################################################################################
--]]

-- Shortcut `builtin` command
require('telescope.builtin')

-- Load actions
local actions = require("telescope.actions")

-- Set mapping to quit telescope with a single escape key
require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
    },
})

