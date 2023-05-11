--[[
################################################################################
# CMP CONFIG ----------------------------------------------------------------- #
################################################################################
--]]

local M = {}

-- Load luasnip and 
require("luasnip.loaders.from_vscode").load()
local cmp = require("cmp")

-- Setup CMP plugin
function M.setup()
    vim.o.completeopt = "menuone,noselect,preview"

    cmp.setup({
        preselect = cmp.PreselectMode.None,
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

M.select = {behavior = cmp.SelectBehavior.Select}

-- Set mappings
M.mappings = require("lsp-zero").defaults.cmp_mappings({
    ["<Tab>"] = cmp.mapping.select_next_item(M.select),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(M.select),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<C-Space>"] = cmp.mapping.complete(),
})


-- Set up lspconfig
require("cmp_nvim_lsp").default_capabilities()

return M
