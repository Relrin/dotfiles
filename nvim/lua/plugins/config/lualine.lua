local lualine = require('lualine')

local colors = {
    red      = '#ec5f67',
    orange   = '#ff8800',
    green    = '#98be65',
    white    = '#ffffff',
}

local config = {
    options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = { 
            'neo-tree', 
            'winbar',
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            {
                'branch',
                icon = '',
            },
            {
                'diff',
                colored = true,
                symbols = { 
                    added = '+', 
                    modified = '~', 
                    removed = '-'
                },
                diff_color = {
                    added    = { fg = colors.green },
                    modified = { fg = colors.orange },
                    removed  = { fg = colors.red },
                },
            }, 
            'diagnostics'
        },
        lualine_c = {'filename'},
        lualine_x = {
            'encoding', 
            'fileformat', 
            {
                'filetype',
                icons_enabled = false
            }
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

lualine.setup(config)