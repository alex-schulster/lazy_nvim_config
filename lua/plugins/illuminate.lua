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
    -- Add cutoff to 25 000 lines to ignore file that are longer
    large_file_cutoff = 25000,
    -- should_enable: a callback that overrides all other settings to
    -- enable/disable illumination. This will be called a lot so don't do
    -- anything expensive in it.
    should_enable = function(bufnr)
        local max_file_size = 100 * 1024 -- 100 kB in bytes
        local file_size = vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr))
        return file_size < max_file_size
    end,
})

-- Define remaps
vim.keymap.set("n", "m", function () illuminate.goto_next_reference() end)
vim.keymap.set("n", "M", function () illuminate.goto_prev_reference() end)
