--[[
################################################################################
# HARPOON CONFIG ------------------------------------------------------------- #
################################################################################
--]]

-- Load harpoon functions
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- Set keymaps
require("which-key").register({
    -- Harpoon
    ["<leader>a"] = {name = "󱡁 Harpoon"},
    ["<leader>aa"] = {mark.add_file, " Add this file"},
    ["<leader>am"] = {ui.toggle_quick_menu, " Menu"},
    ["<leader>ah"] = {function() ui.nav_file(1) end, "File 1"},
    ["<leader>aj"] = {function() ui.nav_file(2) end, "File 2"},
    ["<leader>ak"] = {function() ui.nav_file(3) end, "File 3"},
    ["<leader>al"] = {function() ui.nav_file(4) end, "File 4"},
})

