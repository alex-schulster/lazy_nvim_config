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
})

-- Define remaps
vim.keymap.set("n", "m", function () illuminate.goto_next_reference() end)
vim.keymap.set("n", "M", function () illuminate.goto_prev_reference() end)
