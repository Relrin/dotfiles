return {
    "nvim-neo-tree/neo-tree.nvim",
    version = "2.57",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
        { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" }
    },
    config = function ()
      require('neo-tree').setup {}
    end,
}