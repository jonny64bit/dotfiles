return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "vimdoc",
            "javascript",
            "typescript",
            "c",
            "lua",
            "rust",
            "c_sharp",
            "dockerfile",
            "scss",
            "yaml"
        },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
        }
    }
}
