local neotree = require('neo-tree')

local config = {
    default_component_configs = {
        git_status = {
            symbols = {
                -- Change type
                added     = "",
                modified  = "",
                deleted   = "✖",
                renamed   = "",
                -- Status type
                untracked = "",
                ignored   = "",
                unstaged  = "",
                staged    = "",
                conflict  = "󱚟",
            }
        },
    },
}

neotree.setup(config)