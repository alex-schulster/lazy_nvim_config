--[[
################################################################################
# WHICHKEY CONFIG ------------------------------------------------------------ #
################################################################################
--]]

-- Enable and set timeout for whichkey to appear
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Setting up whichkey
require("which-key").setup({
    -- Plugins setup
    plugins = {
        -- Enable / disable help for different context
        presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = false, -- default bindings on <c-w>
            nav = false, -- misc bindings to work with windows
            z = false, -- bindings for folds, spelling and others prefixed with z
            g = false, -- bindings for prefixed with g
        }
    },
    -- Whichkey window settings
    window = {
        border = "single", -- none, single, double, shadow
    },

    -- Disable help message in status line
    show_help = false,

    -- Don't display non named bindings
    ignore_missing = true
})

-- Set keymaps
require("which-key").register({
    -- Quick actions
    ["<leader>p"] = {[["_dP]], "屢Paste without yank"},
    ["<leader>y"] = {[["+y]], " Yank in system clipboard"},
    ["<leader>d"] = {[["_d]], " Delete in void register"},

    -- Close current window
    ["<leader>c"] = {"<C-w>c", " Close current window"},

    -- Make current file executable
    ["<leader>x"] = {"<cmd>!chmod +x %<CR>", "󱨗 File chmod +x"},

    -- Vertical and horizontal splits
    ["<leader>\\"] = {"<cmd>vsplit<cr>", " Vertical split"},
    ["<leader>-"] = {"<cmd>split<cr>", " horizontal split"},

    -- Set back line numbering in case of bug
    ["<leader>n"] = {function ()
        vim.opt.nu = true
        vim.opt.relativenumber = true
    end, " Set numbering"},

    -- Open file explorer
    ["<leader>e"] = {"<cmd>Ex<cr>", "פּ File explorer"},

    -- Add shortcut for indenting the whole buffer in one go
    ["<leader>="] = {"ggVG=", "  Buffer indent"},

    -- Shortcut for alpha menu
    ["<leader>m"] = {function ()
        -- Get the number of opened windows
        local num_splits = #vim.api.nvim_tabpage_list_wins(0)

        -- Close all of them except the last one
        for i = 1,num_splits-1 do
            print("Closing " .. i)
            vim.cmd("close")
        end

        -- On the last window, call the alpha menu
        vim.cmd("Alpha")
    end, "󰻀 Alpha menu"},

    -- Lazygit
    ["<leader>g"] = {vim.cmd.LazyGit, " LazyGit"},
})
