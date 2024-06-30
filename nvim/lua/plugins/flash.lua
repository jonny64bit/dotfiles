return {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
        label = {
            min_pattern_length = 2,
            style = "overlay",
            rainbow = {
                enabled = true,
                -- number between 1 and 9
                shade = 3,
              },
        }
    },
    -- stylua: ignore
    keys = {
        { "<leader>s", mode = { "n", "x", "o" }, 
        function() require("flash").jump() end,
           desc = "Flash" }
    },
}
