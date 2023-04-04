--[[
################################################################################
# GENREAL NEOVIM SETTINGS ---------------------------------------------------- #
################################################################################
--]]

-- Set relative number line
vim.opt.nu = true
vim.opt.relativenumber = true

-- Set tabstop to 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enable smart indent
vim.opt.smartindent = true

-- Disable text wrapping
vim.opt.wrap = false

-- Disable file swap / backup but enable persistent undo tree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Improve text search in file
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Use true terminal colours
vim.opt.termguicolors = true

-- Keep 10 lines betweeen cursor and border of screen when scrolling
vim.opt.scrolloff = 10
-- Keep sign column always active
vim.opt.signcolumn = "yes"
-- Improve nvim handling of filename
vim.opt.isfname:append("@-@")

-- Update time in ms
vim.opt.updatetime = 50

-- Set vertical ruler at column 85 to avoid too long lines
vim.opt.colorcolumn = "85"

-- netrw settings
vim.g.netrw_banner = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = '30'

