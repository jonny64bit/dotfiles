return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            integrations = {
                cmp = true,
                treesitter = true,
                flash = true,
                telescope = {
                    enabled = true
                },
                which_key = true
            }
        })
    end
}
