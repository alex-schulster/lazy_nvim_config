--[[
################################################################################
# ILLUMINATE CONFIG ---------------------------------------------------------- #
################################################################################
--]]

-- Load module
local illuminate = require("illuminate")

-- Configure plugin
illuminate.configure({
    -- delay: delay in milliseconds
    delay = 0,
    -- Add cutoff to 25 000 lines to ignore file that are longer
    large_file_cutoff = 25000
})

-- Define remaps
vim.keymap.set("n", "m", function () illuminate.goto_next_reference() end)
vim.keymap.set("n", "M", function () illuminate.goto_prev_reference() end)
