--[[
################################################################################
# CMP CONFIG ----------------------------------------------------------------- #
################################################################################
--]]

local cmp = {}

-- Setup CMP plugin
function cmp.setup()
    require('cmp').setup({
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end
        },
        sources = {
            { name = "nvim_lsp" },  -- LSP
            { name = 'luasnip' },   -- Snippets
            { name = "path" },      -- Path
            -- more sources
        },
    })
end

cmp.select = {behavior = require('cmp').SelectBehavior.Select}

-- Set mappings
cmp.mappings = require("lsp-zero").defaults.cmp_mappings({
    ['<Tab>'] = require("cmp").mapping.select_next_item(cmp.select),
    ['<S-Tab>'] = require("cmp").mapping.select_prev_item(cmp.select),
    ['<CR>'] = require("cmp").mapping.confirm({ select = true }),
    ["<C-Space>"] = require("cmp").mapping.complete(),
})


-- Set up lspconfig
require('cmp_nvim_lsp').default_capabilities()

return cmp
