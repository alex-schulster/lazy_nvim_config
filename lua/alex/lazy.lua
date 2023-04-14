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
    -- Tokyonight theme
    {
        'folke/tokyonight.nvim',
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "moon",	-- Set style among the 4 available
                -- transparent = true,	-- Set transparent background
            })
            -- Apply Tokyonight color scheme
            vim.cmd[[colorscheme tokyonight]]
        end,
    },

    -- Telescope
    {
        lazy = true,
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        cmd = {"Telescope"},
        config = function ()
            require("plugins.telescope")
        end
    },

    -- Treesitter
    {
        lazy = true,
        'nvim-treesitter/nvim-treesitter',
        cmd = {"TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo", "TSUpdate"},
        event = "BufEnter",
        build = function()
            vim.cmd("autocmd FileType * TSUpdate")
        end,
        config = function ()
            require("plugins.treesitter")
        end,
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring',
            config = function()
                require("plugins.commentstring")
            end
        },

    },

    -- Harpoon
    {
        lazy = true,
        'ThePrimeagen/harpoon',
        event = "VeryLazy",
        config = function ()
            require("plugins.harpoon")
        end
    },

    -- Lazygit
    {
        lazy = true,
        'kdheepak/lazygit.nvim',
        cmd = "LazyGit",
        config = function ()
            require("plugins.lazygit")
        end
    },

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            { 'williamboman/mason.nvim', build = vim.cmd.MasonUpdate },
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},           -- Required
            {'hrsh7th/cmp-nvim-lsp'},       -- Required
            {'hrsh7th/cmp-path'},           -- Required
            {'saadparwaiz1/cmp_luasnip'},   -- Required
            {'L3MON4D3/LuaSnip'},           -- Required

            -- Lsp progress in status bar
            {'linrongbin16/lsp-progress.nvim'},
        },
        config = function ()
            require("plugins.lsp")
        end
    },

    -- Function signatures
    {
        lazy = true,
        "ray-x/lsp_signature.nvim"
    },

    -- Floating file structure
    {
        lazy = true,
        "SmiteshP/nvim-navbuddy",
        dependencies = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim"
        }
    },

    -- Collection of snippets
    'rafamadriz/friendly-snippets',

    -- Which key
    {
        lazy = true,
        "folke/which-key.nvim",
        keys = "<space>",
        event = "VeryLazy",
        config = function ()
            require("plugins.whichkey")
        end
    },

    -- Startup screen
    {
        'goolord/alpha-nvim',
        config = function ()
            require("plugins.alpha")
        end
    },

    -- Lualine for status bar
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require("plugins.lualine")
        end
    },

    -- LSP loading progress bar
    {
        lazy = true,
        'linrongbin16/lsp-progress.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require("plugins.lsp-progress")
        end
    },


    -- Sneak for quick navigation with s
    'justinmk/vim-sneak',

    -- Identation guidelines
    "lukas-reineke/indent-blankline.nvim",

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        config = function()
            require("plugins.autopairs")
        end
    },

    -- Vinegar for improved netrw
    'tpope/vim-vinegar',

    -- Nvim Lua API documentation
    'folke/neodev.nvim',

    -- gcc for commenting
    'tpope/vim-commentary',

    -- For smarter commenting

    -- Todo comments
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function ()
            require("plugins.todo")
        end
    },

    -- Illuminate the word under the curser and its references
    {
        'RRethy/vim-illuminate',
        config = function()
            require("plugins.illuminate")
        end
    },

    -- Surround feature
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    -- Seamless navigation between vim and tmux panes
    {
        lazy = true,
        'christoomey/vim-tmux-navigator',
        event = "VeryLazy",
    },

    -- STM LSP local plugin
    -- {
    --     dir = "~/local/code/Lua/stm_lsp_nvim/",
    --     name = "stm_lsp_nvim"
    -- },
    {
        lazy = true,
        "alex-schulster/stm_lsp_nvim",
        ft = {"c", "h", "cpp", "hpp"},
        config = function ()
            require("plugins.stm_lsp_nvim")
        end
    },

    -- Markdown preview plugin
    {
        lazy = true,
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
        ft = "md",
    },
}

-- Call lazy
require("lazy").setup(Plugins)

