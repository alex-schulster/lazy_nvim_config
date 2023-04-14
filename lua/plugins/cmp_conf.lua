--[[
################################################################################
# CMP CONFIG ----------------------------------------------------------------- #
################################################################################
--]]

local M = {}

-- Load luasnip and 
require("luasnip.loaders.from_vscode").load()

-- Setup CMP plugin
function M.setup()
    require("cmp").setup({
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end
        },
        sources = {
            { name = "nvim_lsp" },  -- LSP
            { name = "luasnip" },   -- Snippets
            { name = "path" },      -- Path
            -- more sources
        },
    })
end

M.select = {behavior = require("cmp").SelectBehavior.Select}

-- Set mappings
M.mappings = require("lsp-zero").defaults.cmp_mappings({
    ["<Tab>"] = require("cmp").mapping.select_next_item(M.select),
    ["<S-Tab>"] = require("cmp").mapping.select_prev_item(M.select),
    ["<CR>"] = require("cmp").mapping.confirm({ select = true }),
    ["<C-Space>"] = require("cmp").mapping.complete(),
})


-- Set up lspconfig
require("cmp_nvim_lsp").default_capabilities()

return M
