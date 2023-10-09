return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = function()
        return {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
            { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find Files Git" },
            { "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
        }
    end,
}
