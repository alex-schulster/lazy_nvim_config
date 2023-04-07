--[[
################################################################################
# LSP CONFIG ----------------------------------------------------------------- #
################################################################################
--]]

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
    library = {
        enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
        -- these settings will be used for your Neovim config directory
        runtime = true, -- runtime path
        types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
        plugins = true, -- installed opt or start plugins in packpath
        -- you can also specify the list of plugins to make available as a workspace library
        -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
    },
    setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
    -- With lspconfig, Neodev will automatically setup your lua-language-server
    -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
    -- in your lsp start options
    lspconfig = true,
    -- much faster, but needs a recent built of lua-language-server
    -- needs lua-language-server >= 3.6.0
    pathStrict = true,
})

-- Start LSP
local lsp = require('lsp-zero')
local luasnip = require('luasnip')
local navbuddy = require("nvim-navbuddy")

-- Load recommended presets
lsp.preset("recommended")

-- Remap key to launch Mason GUI
vim.keymap.set("n", "<leader>lm", vim.cmd.Mason)

-- Set up auto completion plugin
local cmp = require('cmp')

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = {
        { name = "nvim_lsp" },  -- LSP
        { name = 'luasnip' },   -- Snippets
        { name = "path" },      -- Path
        -- more sources
    },
})

-- Set key bindings
lsp.setup_nvim_cmp({
    mapping = cmp_mappings
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

-- Create compile_commands.json generator function
local function compile_commands()
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

-- Define function that will be executed when attaching an LSP to a buffer
lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    -- Attach breadcrumbs
    navbuddy.attach(client, bufnr)

    -- Set remaps
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>ln", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>lN", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>lB", function () compile_commands() end, opts)
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

-- Load signature plugin
require "lsp_signature".setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
        border = "rounded"
    }
})

-- Load and setup LSP UI
require("LspUI").setup({
    lightbulb = {
        enable = true, -- close by default
        command_enable = false, -- close by default, this switch does not have to be turned on, this command has no effect
        icon = "",
    },
    code_action = {
        enable = true,
        command_enable = true,
        icon = "",
        keybind = {
            exec = "<CR>",
            prev = "k",
            next = "j",
            quit = "q",
        },
    },
    rename = {
        enable = true,
        command_enable = true,
        auto_select = true, -- whether select all automatically
        keybind = {
            change = "<CR>",
            quit = "<ESC>",
        },
    },
    diagnostic = {
        enable = true,
        command_enable = true,
        icons = {
            Error = " ",
            Warn = " ",
            Info = " ",
            Hint = " ",
        },
    },
})
