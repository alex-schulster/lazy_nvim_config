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
    ignore_missing = false
})

-- Set keymaps
require("which-key") .register({
    -- Telescope
    ["<leader>f"] = {name = "  Find"},
    ["<leader>ff"] = {"<cmd>Telescope find_files<cr>", " File"},
    ["<leader>ft"] = {"<cmd>Telescope live_grep<cr>", "﬍ Text"},

    -- Quick actions
    ["<leader>p"] = {[["_dP]], "屢Delete and paste"},
    ["<leader>y"] = {[["+y]], " Yank in system clipboard"},
    ["<leader>d"] = {[["_d]], " Delete in void register"},

    -- Lazy menu

    -- Make current file executable
    ["<leader>x"] = {"<cmd>!chmod +x %<CR>", " File chmod +x"},

    -- Lazy git
    ["<leader>g"] = {"<cmd>LazyGit<CR>", " LazyGit"},

    -- Harpoon
    ["<leader>a"] = {name = " 理Harpoon"},
    ["<leader>aa"] = {" Add this file"},
    ["<leader>am"] = {" Menu"},
    ["<leader>ah"] = {"File 1"},
    ["<leader>aj"] = {"File 2"},
    ["<leader>ak"] = {"File 3"},
    ["<leader>al"] = {"File 4"},

    -- LSP
    ["<leader>l"] = {name = " 力LSP"},
    ["<leader>lm"] = {" Mason"},
    ["<leader>la"] = {" Code actions"},
    ["<leader>lr"] = {"﬍ Rename"},
    ["<leader>lf"] = {" Mason"},
    ["<leader>ll"] = {"<cmd>Lazy<cr>", "鈴Lazy menu"},
    ["<leader>ln"] = {"ﬃ Next diagnostic"},
    ["<leader>lN"] = {"ﬂ Previous diagnostic"},

    -- Vertical and horizontal splits
    ["<leader>\\"] = {"<cmd>vsplit<cr>", "| Vertical split"},
    ["<leader>-"] = {"<cmd>split<cr>", "- horizontal split"},
})

