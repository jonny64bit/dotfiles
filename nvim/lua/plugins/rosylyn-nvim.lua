return {
    "seblj/roslyn.nvim",
    lazy = false,
    enabled = true,
    config = function()
        require("roslyn").setup()
    end
}