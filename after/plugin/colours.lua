--[[
################################################################################
# SET COLOR SCHEME ----------------------------------------------------------- #
################################################################################
--]]

-- Set theme settings
require("tokyonight").setup({
    style = "moon",	-- Set style among the 4 available
    -- transparent = true,	-- Set transparent background to get terminal default's one
})

-- Apply Tokyonight color scheme
vim.cmd[[colorscheme tokyonight]]
