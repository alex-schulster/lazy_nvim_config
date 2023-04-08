--[[
################################################################################
# LSP CONFIG ----------------------------------------------------------------- #
################################################################################
--]]

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev_conf").setup()

-- Start LSP
local lsp = require('lsp-zero')

-- Load recommended presets
lsp.preset("recommended")

-- Set up auto completion plugin
local cmp = require("cmp_conf")

-- Setup CMP
cmp.setup()

-- Set key bindings
lsp.setup_nvim_cmp({
    mapping = cmp.mappings
})

-- Set up some LSP settings
lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = '?',
        warn = '',
        hint = '󱠂',
        info = ''
    }
})

-- Define always available keymaps

-- Set keymaps
require("which-key").register({
    ["<leader>l"] = {name = "力LSP"},
    ["<leader>lm"] = {vim.cmd.Mason, " Mason"},
    ["<leader>ll"] = {"<cmd>Lazy<cr>", "鈴Lazy menu"},
})

-- Define function that will be executed when attaching an LSP to a buffer
lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    -- Attach breadcrumbs
    require("nvim-navbuddy").attach(client, bufnr)

    -- Set remaps
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts)

    -- Which-key bindings
    require("which-key").register({
        ["<leader>la"] = {function() vim.lsp.buf.code_action() end, " Code actions"},
        ["<leader>lr"] = {function() vim.lsp.buf.rename() end, "﬍ Rename"},
        ["<leader>lf"] = {function() vim.lsp.buf.references() end, " Find references"},
        ["<leader>ln"] = {function() vim.diagnostic.goto_next() end, "ﬃ Next diagnostic"},
        ["<leader>lN"] = {function() vim.diagnostic.goto_prev() end, "ﬂ Previous diagnostic"},
        ["<leader>lb"] = {"<cmd>Navbuddy<cr>", "פּ Nav Buddy"},
        ["<leader>lB"] = {function ()
            require("compile_commands").compile_commands()
        end, "﬙ STM32 LSP patch"},
    })
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- Finally, load lsp
lsp.setup()

-- Set diagnostic text as virtual
vim.diagnostic.config({
    virtual_text = true
})

