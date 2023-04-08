return {
    "nvim-neo-tree/neo-tree.nvim",
    version = "2.57",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
        { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Show/Hide NeoTree" }
    },
    config = function() 
      require('configs.neo-tree')
    end
}