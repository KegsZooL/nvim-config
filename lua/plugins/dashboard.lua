local db = require('dashboard')
local builtin = require('telescope.builtin')


local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
local version = vim.version()
local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch


db.setup {
    theme = "doom",
    config = {
        header = {
        "                                                                                                          ",
        "                                                                                                          ",
        "                                                                                                          ",
        "                                                                                                          ",
        "                                                                                                          ",
        "                                                                                                          ",
        "                                                                                                  ,--,    ",
        "                ,--.                                              ,----,                       ,---.'|    ",
        "            ,--/  /|                                            .'   .`|                       |   | :    ",
        "          ,---,': / '                                         .'   .'   ;                       :   : |    ",
        "          :   : '/ /                                        ,---, '    .'    ,---.      ,---.   |   ' :    ",
        "          |   '   ,                ,----._,.   .--.--.      |   :     ./    '   ,'\\    '   ,'\\  ;   ; '    ",
        "          '   |  /       ,---.    /   /  ' /  /  /    '     ;   | .'  /    /   /   |  /   /   | '   | |__  ",
        "          |   ;  ;      /     \\  |   :     | |  :  /`./     `---' /  ;    .   ; ,. : .   ; ,. : |   | :.'| ",
        "          :   '   \\    /    /  | |   | .\\  . |  :  ;_         /  ;  /     '   | |: : '   | |: : '   :    ; ",
        "          |   |    '  .    ' / | .   ; ';  |  \\  \\    `.     ;  /  /--,   '   | .; : '   | .; : |   |  ./  ",
        "          '   : |.  \\ '   ;   /| '   .   . |   `----.   \\   /  /  / .`|   |   :    | |   :    | ;   : ;    ",
        "          |   | '_\\.' '   |  / |  `---`-'| |  /  /`--'  / ./__;       :    \\   \\  /   \\   \\  /  |   ,/     ",
        "          '   : |     |   :    |  .'__/\\_: | '--'.     /  |   :     .'      `----'     `----'   '---'      ",
        "          ;   |,'      \\   \\  /   |   :    :   `--'---'   ;   |  .'                                        ",
        "          '---'         `----'     \\   \\  /               `---'                                            ",
        "                                    `--`-'                                                                 ",
        "                                                                                                           ",
        "                                                                                                           ",
        "                                                                                                           ",
        "                                                                                                           ",
        "                                                                                                           ",
        "                                                                                                           ",
        },
        center = {
          {
            icon = '  > ',
            icon_hl = 'Title',
            desc = 'Find File                  ',
            desc_hl = 'String',
            key = ' ff',
            key_format = ' %s',
            action = function() builtin.find_files() end
          },
          {
            icon = '󰱼  > ',
            icon_hl = 'Title',
            desc = 'Find Text',
            desc_hl = 'String',
            key = 'fw',
            key_format = ' %s',
            action = function() builtin.live_grep() end
          },
          {
            icon = '  > ',
            icon_hl = 'Title',
            desc = 'New File',
            desc_hl = 'String',
            key = 'n',
            key_format = ' %s',
            action = function() vim.cmd(':enew') end 
          },
          {
            icon = '  > ',
            icon_hl = 'Title',
            desc = 'Configuration',
            desc_hl = 'String',
            key = 'c',
            key_format = ' %s',
            action = "edit ~/.config/nvim/init.lua" 
          },
          {
            icon = '󰈆  > ',
            icon_hl = 'Title',
            desc = 'Quit',
            desc_hl = 'String',
            key = 'q',
            key_format = ' %s',
            action = ":quit" 
          },
        },
        footer = { datetime .. nvim_version_info }
    }
}
