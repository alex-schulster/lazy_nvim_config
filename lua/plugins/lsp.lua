--[[
################################################################################
# LSP CONFIG ----------------------------------------------------------------- #
################################################################################
--]]

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("plugins.neodev_conf").setup()

-- Load LSP
local lsp = require('lsp-zero')

-- Load recommended presets
lsp.preset("recommended")

-- Set up auto completion plugin
local cmp = require("plugins.cmp_conf")

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
    ["<leader>lm"] = {vim.cmd.Mason, " Mason"},
})

-- Define function that will be executed when attaching an LSP to a buffer
lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    -- Attach breadcrumbs
    if client["name"] ~= 'ltex' and client["name"] ~= 'copilot' then
        require("nvim-navbuddy").attach(client, bufnr)
    elseif client["name"] == 'ltex' then
        require("ltex_extra").setup(
        {
            -- https://valentjn.github.io/ltex/supported-languages.html#natural-languages
            load_langs = { "en-US", "fr"}, -- en-US as default

            -- boolean : whether to load dictionaries on startup
            init_check = true,

            -- string : relative or absolute path to store dictionaries
            path = ".ltex", -- project root or current working directory

            -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
            log_level = "none",
        }
        )
    end

    -- Attach lsp signature
    require("lsp_signature").on_attach(nil, bufnr)

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
    })
end)

-- Setup signature plugin
require("plugins.signature")

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
-- Configure clangd to disable function arguments placeholders
require("lspconfig").clangd.setup({
    cmd = {'clangd', '--function-arg-placeholders=0'}
})

-- Set border for lsp window
require('lspconfig.ui.windows').default_options.border = 'single'

-- Finally, load lsp
lsp.setup()

-- Set diagnostic text as virtual
vim.diagnostic.config({
    virtual_text = true
})

