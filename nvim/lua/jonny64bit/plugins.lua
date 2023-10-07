require("lazy").setup({
  "folke/which-key.nvim",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
})
