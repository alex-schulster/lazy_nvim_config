--[[
################################################################################
# LATEX CONFIG --------------------------------------------------------------- #
################################################################################
--]]
vim.g.vimtex_view_method = 'skim'

require("which-key").register({
    ["<leader>t"] = {name = " LaTeX"},
    ["<leader>tc"] = {"<cmd>VimtexCompile<cr>", " Start auto compile"},
    ["<leader>ts"] = {"<cmd>VimtexStop<cr>", " Stop auto compile"},
    ["<leader>v"] = {"<cmd>VimtexView<cr>", "󰣉 Tex forward search"},
})
