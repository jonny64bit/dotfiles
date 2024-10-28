return {
    "someone-stole-my-name/yaml-companion.nvim",
    ft = { "yaml", "yml" },
    dependencies = {
        { "neovim/nvim-lspconfig" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope.nvim" },
    },
    config = function(opts)
        local cfg = require("yaml-companion").setup(opts)
        cfg.schemas = {
            {
                name = "Kubernetes 1.22.4",
                uri =
                "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.4-standalone-strict/all.json",
            }
        }
        require("lspconfig")["yamlls"].setup(cfg)
        require("telescope").load_extension("yaml_schema")
    end
}
