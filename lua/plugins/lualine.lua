--[[
################################################################################
# LUALINE CONFIG ------------------------------------------------------------- #
################################################################################
--]]

local custom_theme = require("lualine.themes.tokyonight")
custom_theme.normal.c.bg = "#23273b"
custom_theme.inactive.c.bg = "#23273b"
custom_theme.inactive.c.fg = "#565f89"

-- Setup plugin
require("lualine").setup({
    options = {
        theme = custom_theme,
        component_separators = { left = '|', right = '|'},
        section_separators = { left = ' ', right = ' '},
    },
    sections = {
        lualine_a = {'mode'},
        -- lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_b = {'diagnostics'},
        lualine_c = {'filename'},
        -- lualine_x = {'encoding', 'filetype'},
        lualine_x = {require("lsp-progress").progress},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
})
