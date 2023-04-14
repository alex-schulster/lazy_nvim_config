--[[
################################################################################
# FUNCTIONS SIGNATURES CONFIG ------------------------------------------------ #
################################################################################
--]]

-- Load signature plugin
require("lsp_signature").setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
        border = "rounded"
    }
})

