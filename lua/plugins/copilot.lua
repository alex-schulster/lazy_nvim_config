--[[
################################################################################
# ALPHA NVIM CONFIG ---------------------------------------------------------- #
################################################################################
--]]

-- Disable copilot on startup
vim.cmd("Copilot disable")

-- Define a Vim command that toggles Copilot and displays a message
vim.api.nvim_create_user_command(
    'ToggleCopilot',
    function()
        local copilot_status = vim.g.copilot_enabled
        if copilot_status == nil or copilot_status == 0 then
            vim.cmd("Copilot enable")
            print("Copilot enabled")
        else
            vim.cmd("Copilot disable")
            print("Copilot disabled")
        end
    end,
    {}
)

-- Map <C-c> to the new command
vim.api.nvim_set_keymap('n', '<C-c>', ':ToggleCopilot<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-c>', '<cmd>ToggleCopilot<CR>', { noremap = true, silent = true })
