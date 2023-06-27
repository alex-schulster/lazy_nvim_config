--[[
################################################################################
# JSON UTILITY PLUGIN -------------------------------------------------------- #
################################################################################
--]]

require("which-key").register({
    ["<leader>j"] = {name = " JSON"},
    ["<leader>jf"] = {"<cmd>JqxList<cr><C-w>c", "󰣟 Format document"},
    ["<leader>jl"] = {":JqxList", "List elements"},
    ["<leader>jq"] = {":JqxQuery", "Search elements"},
})
