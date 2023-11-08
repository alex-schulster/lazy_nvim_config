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
                transparent = true,	-- Set transparent background
                on_colors = function (colors)
                    colors.border = colors.fg_gutter
                end
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
        event = {"BufRead", "BufNewFile"},
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
    },

    -- LSP
    {
        lazy = true,
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {
                'williamboman/mason.nvim',
                build = vim.cmd.MasonUpdate,
                config = function ()
                    require("mason").setup({
                        ui = {
                            border = "single"
                        }
                    })
                end,
            },
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},           -- Required
            {'hrsh7th/cmp-nvim-lsp'},       -- Required
            {'hrsh7th/cmp-path'},           -- Required
            {'saadparwaiz1/cmp_luasnip'},   -- Required
            {
                'L3MON4D3/LuaSnip',
                build = "make install_jsregexp",
            },

            -- Lsp progress in status bar
            {
                'linrongbin16/lsp-progress.nvim',
            },

            -- Floating file structure
            {
                "SmiteshP/nvim-navbuddy",
                dependencies = {
                    "neovim/nvim-lspconfig",
                    "SmiteshP/nvim-navic",
                    "MunifTanjim/nui.nvim"
                }
            },
            -- Function signatures
            "ray-x/lsp_signature.nvim",
            -- Collection of snippets
            'rafamadriz/friendly-snippets',
            -- Nvim Lua API documentation
            'folke/neodev.nvim',
            -- gcc for commenting
            'tpope/vim-commentary',

        },
        config = function ()
            require("plugins.lsp")
        end,
        event = "VeryLazy"
    },

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
    {
        lazy = true,
        'justinmk/vim-sneak',
        event = {"BufRead", "BufNewFile"},
    },

    -- Identation guidelines
    {
        lazy = true,
        "lukas-reineke/indent-blankline.nvim",
        event = {"BufRead", "BufNewFile"},
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
        event = {"BufRead", "BufNewFile"},
    },

    -- Vinegar for improved netrw
    'tpope/vim-vinegar',

    -- Todo comments
    {
        lazy = true,
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function ()
            require("plugins.todo")
        end,
        event = {"BufRead", "BufNewFile"},
    },

    -- Illuminate the word under the curser and its references
    {
        lazy = true,
        'RRethy/vim-illuminate',
        config = function()
            require("plugins.illuminate")
        end,
        event = {"BufRead", "BufNewFile"},
    },

    -- Surround feature
    {
        lazy = true,
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
        event = {"BufRead", "BufNewFile"},
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
        event = "VeryLazy",
    },

    -- Debugging
    {
        "mfussenegger/nvim-dap",
        config = function ()
            require("plugins.dap")
        end,
        dependencies = {
            "rcarriga/nvim-dap-ui",
        }
    },

    {
        'chipsenkbeil/distant.nvim',
        branch = 'v0.2',
        config = function()
            require('distant').setup {
                -- Applies Chip's personal settings to every machine you connect to
                --
                -- 1. Ensures that distant servers terminate with no connections
                -- 2. Provides navigation bindings for remote directories
                -- 3. Provides keybinding to jump into a remote file's parent directory
                ['*'] = require('distant.settings').chip_default()
            }
        end
    },

    {
        lazy = true,
        "gennaro-tedesco/nvim-jqx",
        ft = { "json", "yaml" },
        config = function ()
            require("plugins.jq")
        end,
    },

    -- Vim session for TMUX resurrect
    {
        "tpope/vim-obsession"
    },

    -- Github copilot
    {
        lazy = true,
        "github/copilot.vim",
        config = function ()
            require("plugins.copilot")
        end,
        event = "VeryLazy"
    }
}

-- [[ ################### LAZY CONFIGURATION HERE #################### ]] --
Options = {
    -- UI setup
    ui = {
        border = 'single'
    },
}


-- Call lazy
require("lazy").setup(Plugins, Options)

