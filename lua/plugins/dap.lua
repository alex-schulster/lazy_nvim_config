--[[
################################################################################
# NVIM DAP CONFIG ------------------------------------------------------------ #
################################################################################
--]]

-- Define highlighting colours
vim.api.nvim_set_hl(0, 'DapBreakpoint', {fg='#f7768e', bg='#1d2030'})
vim.api.nvim_set_hl(0, 'DapLogPoint', {fg='#7dcfff', bg='#1d2030'})
vim.api.nvim_set_hl(0, 'DapStopped', {fg='#9ece6a', bg='#1d2030'})

-- Set icons and colours
vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', numhl= 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', numhl= 'DapStopped' })
