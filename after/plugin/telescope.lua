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

-- Set keymaps
require("which-key").register({
    -- Telescope
    ["<leader>f"] = {name = " Find"},
    ["<leader>ff"] = {"<cmd>Telescope find_files<cr>", " File"},
    ["<leader>ft"] = {"<cmd>Telescope live_grep<cr>", " Text in workspace"},
    ["<leader>fw"] = {"<cmd>Telescope grep_string<cr>", "󰟵 Selection / Word under cursor"},
    ["<leader>fb"] = {"<cmd>Telescope buffers<cr>", "﬘ Buffers"},
    ["<leader>fh"] = {"<cmd>Telescope current_buffer_fuzzy_find<cr>", "什Text in this buffer"},

})
