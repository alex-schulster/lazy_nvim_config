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

-- Set format options to disable auto comment on new lines
-- vim.api.nvim_create_autocmd(
--     {'BufRead', 'BufNewFile'},
--     {command = "set formatoptions-=cro"}
-- )

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

-- Set vertical ruler at column 80 to avoid too long lines
vim.opt.colorcolumn = "80"

-- netrw settings
vim.g.netrw_banner = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = '30'
vim.g.netrw_list_hide = '__pycache__'

-- Disable nvim modelines
vim.opt.modeline = false

-- Enable buffer-specific textwidth settings for .tex and .md files
vim.cmd([[
  augroup FileTypeConfig
    autocmd!
    autocmd FileType tex,md lua Set_textwidth()
  augroup END
]])

-- Autocommand to write server address on latex open file
vim.cmd([[
  augroup vimtex_common
    autocmd!
    autocmd FileType tex lua Write_server_name()
  augroup END
]])

-- Function to set textwidth to 80
function Set_textwidth()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_option(bufnr, 'textwidth', 80)
end

-- Function to write server address to temporary file
function Write_server_name()
  local nvim_server_file = '/tmp/vimtexserver.txt'
  vim.fn.writefile({vim.v.servername}, nvim_server_file)
end

