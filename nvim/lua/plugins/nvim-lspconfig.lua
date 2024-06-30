return {
    'neovim/nvim-lspconfig',
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim"
    },
    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()

        require('mason-lspconfig').setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer"
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,

                csharp_ls = function()
                    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
                    local lspconfig = require('lspconfig')

                    lspconfig.csharp_ls.setup({
                        root_dir = function(startpath)
                            return lspconfig.util.root_pattern("*.sln")(startpath)
                                or lspconfig.util.root_pattern("*.csproj")(startpath)
                                or lspconfig.util.root_pattern("*.fsproj")(startpath)
                                or lspconfig.util.root_pattern(".git")(startpath)
                        end,
                        capabilities = lsp_capabilities,
                    })
                end
            }
        })
    end
}
