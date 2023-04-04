--[[
################################################################################
# LAZY PACKAGE MANAGER ------------------------------------------------------- #
################################################################################
--]]

-- Find lazyvim install path
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- If path does not exist, create it by installing lazy.nvim
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

-- Add lazy.nvim to run time path
vim.opt.rtp:prepend(lazypath)

-- [[ ####################### INSTALL PLUGINS HERE ####################### ]] --
Plugins = {
    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Tokyonight theme
    'folke/tokyonight.nvim',

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            vim.cmd("autocmd FileType * TSUpdate")
        end,
    },

    -- Harpoon
    'ThePrimeagen/harpoon',

    -- Lazygit
    'kdheepak/lazygit.nvim',

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Mason
            'williamboman/mason.nvim',
            build = vim.cmd.MasonUpdate
            },
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},           -- Required
            {'hrsh7th/cmp-nvim-lsp'},       -- Required
            {'hrsh7th/cmp-path'},           -- Required
            {'saadparwaiz1/cmp_luasnip'},   -- Required
            {'L3MON4D3/LuaSnip'},           -- Required
        }
    },

    -- Collection of snippets
    'rafamadriz/friendly-snippets',

    -- Which key
    "folke/which-key.nvim",

    -- Startup screen
    'goolord/alpha-nvim',

    -- FZF for nice picker
    {
        "junegunn/fzf",
        run = function()
            vim.fn["fzf#install"]()
        end
    },
    'junegunn/fzf.vim',

    -- Lualine for status bar
    'nvim-lualine/lualine.nvim',

    -- Sneak for quick navigation with s
    'justinmk/vim-sneak',
}

-- Call lazy
require("lazy").setup(Plugins)

