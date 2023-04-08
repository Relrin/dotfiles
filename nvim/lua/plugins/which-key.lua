return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        plugins = { spelling = true },
    },
    config = function()
        require("which-key").setup()
    end,
}