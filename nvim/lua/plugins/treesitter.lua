return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufNewFile" },
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                init = function()
                    -- no need to load the plugin, if we only need its queries for mini.ai
                    local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
                    local opts = require("lazy.core.plugin").values(plugin, "opts", false)
                    local enabled = false
                    if opts.textobjects then
                        for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
                            if opts.textobjects[mod] and opts.textobjects[mod].enable then
                                enabled = true
                                break
                            end
                        end
                    end
                    if not enabled then
                        require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
                    end
                end,
            },
        },
        keys = {
            { "<c-space>", desc = "Increment selection" },
            { "<bs>", desc = "Decrement selection", mode = "x" },
        },
        ---@type TSConfig
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            context_commentstring = { enable = true, enable_autocmd = false },
            ensure_installed = {
                "bash",
                "html",
                "javascript",
                "json",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "rust",
                "starlark",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = "<nop>",
                    node_decremental = "<bs>",
                },
            },
        },
        ---@param opts TSConfig
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}