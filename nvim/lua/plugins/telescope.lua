return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = function()
        return {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
            { "<leader>fg", "<cmd>Telescope git_files<cr>",  desc = "Find Files Git" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Find Buffers" },
            { "<leader>ft", "<cmd>Telescope live_grep<cr>",  desc = "Find Text" },
            { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Find Old Files" },
            { "<leader>fc", "<cmd>Telescope commands<cr>",  desc = "Find Commands" },
            { "<leader>fy", "<cmd>Telescope registers<cr>",    desc = "Find Registers" },
            { "<leader>fr", "<cmd>Telescope lsp_references<cr>",  desc = "Find References" },
            { "<leader>fi", "<cmd>Telescope lsp_implementations<cr>",  desc = "Find Implementations" },
            { "<leader>fd", "<cmd>Telescope lsp_definitions<cr>",    desc = "Find Definitions" },
            { "<leader>fr", "<cmd>Telescope lsp_type_definitions<cr>",  desc = "Find Types" },
        }
    end,
}
