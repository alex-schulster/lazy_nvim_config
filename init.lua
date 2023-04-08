--[[
################################################################################
# MY NEOVIM CONFIGURATION ---------------------------------------------------- #
################################################################################
--]]

-- Allow require to look in after/plugin folder
local home_dir = os.getenv("HOME")
package.path = home_dir .. "/.config/nvim/after/plugin/?.lua;" .. package.path

-- Calling whole init setup
require("alex")

