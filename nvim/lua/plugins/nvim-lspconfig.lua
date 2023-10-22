return {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_lspconfig()

        lsp_zero.on_attach(function(_, bufnr)
            lsp_zero.default_keymaps({
                preserve_mappings = false,
                buffer = bufnr
            })
        end)

        require('mason-lspconfig').setup({
            ensure_installed = {},
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
                    require('lspconfig').lua_ls.setup({
                        capabilities = lsp_capabilities,
                        on_init = function(client)
                            local path = client.workspace_folders[1].name
                            if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                                client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                                    Lua = {
                                        runtime = {
                                            -- Tell the language server which version of Lua you're using
                                            -- (most likely LuaJIT in the case of Neovim)
                                            version = 'LuaJIT'
                                        },
                                        -- Make the server aware of Neovim runtime files
                                        workspace = {
                                            checkThirdParty = false,
                                            library = {
                                                vim.env.VIMRUNTIME
                                                -- "${3rd}/luv/library"
                                                -- "${3rd}/busted/library",
                                            }
                                            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                                            -- library = vim.api.nvim_get_runtime_file("", true)
                                        }
                                    }
                                })

                                client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                            end
                            return true
                        end
                    })
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
                end,
                gopls = function()
                    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
                    require('lspconfig').gopls.setup({
                        capabilities = lsp_capabilities,
                    })
                end,
            }
        })
    end
}
