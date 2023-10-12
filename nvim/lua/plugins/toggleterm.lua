return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true,
    keys = {
        { "<leader>pt", "<cmd>ToggleTerm size=40 dir=~/Desktop direction=horizontal<cr>",
            desc = "Open a horizontal terminal at the Desktop directory" }
    },
}
