--[[
################################################################################
# TREESITTER COMMENTSTRING CONFIG -------------------------------------------- #
################################################################################
--]]

-- Load plugin
require('nvim-treesitter.configs').setup {
  context_commentstring = {
    enable = true
  }
}
