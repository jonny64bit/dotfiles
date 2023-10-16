return {
    'theprimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = function()
        return {
            { "<leader>hh", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Quick Menu" },
            { "<leader>ha", function() require("harpoon.mark").add_file() end, desc = "Add File" },
            { "<leader>h1", function() require("harpoon.ui").nav_file(1) end, desc = "File 1" },
            { "<leader>h2", function() require("harpoon.ui").nav_file(2) end, desc = "File 2" },
            { "<leader>h3", function() require("harpoon.ui").nav_file(3) end, desc = "File 3" },
            { "<leader>h4", function() require("harpoon.ui").nav_file(4) end, desc = "File 4" },
            { "<leader>h5", function() require("harpoon.ui").nav_file(5) end, desc = "File 5" },
            { "<leader>h6", function() require("harpoon.ui").nav_file(6) end, desc = "File 6" },
            { "<leader>h7", function() require("harpoon.ui").nav_file(7) end, desc = "File 7" },
            { "<leader>h8", function() require("harpoon.ui").nav_file(8) end, desc = "File 8" },
            { "<leader>h9", function() require("harpoon.ui").nav_file(9) end, desc = "File 9" },
            { "<leader>hj", function() require("harpoon.ui").nav_next() end, desc = "Next File" },
            { "<leader>hk", function() require("harpoon.ui").nav_prev() end, desc = "Last File" },
        }
    end
}

