--[[
################################################################################
# COMPILE COMMANDS GENERATOR ------------------------------------------------- #
################################################################################
--]]

local comp_comm = {}

-- Create compile_commands.json generator function
function comp_comm.compile_commands()
    -- Create command string
    local command = string.format("compile_command_generator > /dev/null 2>&1")
    -- Execute command
    local exit_status = os.execute(command)
    -- Check exit status. If failed, raise an exception
    if exit_status ~= 0 then
        error("Not in a STM project directory")
    else
        vim.api.nvim_command("LspRestart")
    end
end

return comp_comm
