--[[
################################################################################
# ALPHA NVIM CONFIG ---------------------------------------------------------- #
################################################################################
--]]

-- Set startup screen
require('alpha').setup(
require('alpha.themes.dashboard').config
)

-- Load Alpha
local alpha = require'alpha'
-- Load dashboard preset
local dashboard = require'alpha.themes.dashboard'

-- Redefine header
dashboard.section.header.val = {
    "                                  ,::;+++++++;:,                                  ",
    "                           ;*%%%SSSSSSSSSSSSSSSS%%%%%%+,                          ",
    "                      ;?%%SSSSS##################SSSSSSS%%%;                      ",
    "                  :?%%SSS######@@@@@@@@@@@@@@@@#######SSSSSS%%?:                  ",
    "                *%SSS####@@@@@@@@@@@@@@@@@@@@@@@@@@########SSSS%%*,               ",
    "             :%%SSS##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@########SSS%%?:             ",
    "           :%%SS##S:::::::#@@@@@@@@@@@@@@@@@@@@@@@@@@@@#########SSS%%*            ",
    "          +%SS##::;S%:::::+@@@@@@@@@@@@@@@@@@@@@@@@@@S?;%#@@######SSS%%:          ",
    "        ,?%SS#%:#@@@@@;::,,@@@@@@@@@@@@@@@@@@@@@@#::,,,,,,,,,%#####SSS%%;         ",
    "        %%SS#S:#@@@@@@:::::@@@@@@@@@@@@@@@@@@@@@%::,,,@@@@@S...S###SSSS%%:        ",
    "       +%SS#@;:@@@@@@:::::@@@@@@@@@@@@@@@@@@@@@@::,,,@@@@@@@@;..SSSSSSSS%?,       ",
    "      :%SS#@@?::;+;::::::@@@@@@@@@@@@@@@@@@@@@@@::,,,@@#*@@@%@..;SSSSSSS%%+       ",
    "      *%S##@@@%:::::::;@@@@@@@@@@@@@@@@@@@@@@@@@S::,,,@@##@@@ ..?SSSSSSS%%?       ",
    "      +%S##@@@@@@@@@@@@@#?+++;;;;;;;;;;;;;;S@@@@@#::,,,,,......;SSSSSSSS%%%       ",
    "      +%S#@@@@@@@@@@#+;;;;;;;::::::::::::::::::?##@@+:::,,,,,;SSSSSSSSSSS%%       ",
    "      :%S##@@@@@@@S;;;::::::::::::::::::::::::::::S##@######SSSSSSSSSSSSS%?       ",
    "       +SS##@@@@@%;;::::::::::::::::::::::::,,,,::::#@@############SSSSSS%;       ",
    "        +SS##@@@@%::;;;:;:::::::::::,,,,,,,,,,,,,,,:*@@@@@@@########SSSS%+        ",
    "         ;SS##@@@@@;;;;;;;:::::::::,,,,,.,,.....,,:;@@@@@@@@@@@#####SSS%+         ",
    "           +SS##@@@@@@@@%++;;;;;;;;:;::::::::::;+S@@@@@@@@@@@@@@###SSS%:          ",
    "             ;SS#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#SS%;            ",
    "                +S#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#S;              ",
    "                   :+#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#;                 ",
    "                         :+##@@@@@@@@@@@@@@@@@@@@@@@@@@@##+;                     ",
    "                                                                                  ",
}

-- Redefine available actions
dashboard.section.buttons.val = {
    dashboard.button( "e", "פּ  File explorer" , ":Ex<CR>"),
    dashboard.button( "f", "  Find file" , "<cmd>Telescope find_files<cr>"),
    dashboard.button( "t", "﬍  Find text" , "<cmd>Telescope live_grep<cr>"),
    dashboard.button( "r", "  Recent files" , "<cmd>Telescope oldfiles<cr>"),
    dashboard.button( "g", "  Lazy Git" , "<cmd>LazyGit<cr>"),
    dashboard.button( "q", "  Quit NVIM" , ":qa<CR>"),
}

-- Apply all settings
alpha.setup(dashboard.config)
