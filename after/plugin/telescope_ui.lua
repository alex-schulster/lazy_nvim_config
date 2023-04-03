--[[
################################################################################
# TELESCOPE UI REPLACEMENT CONFIG -------------------------------------------- #
################################################################################
--]]

-- UI Setup
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }
  }
}

-- Needed for the extension to work
require("telescope").load_extension("ui-select")
