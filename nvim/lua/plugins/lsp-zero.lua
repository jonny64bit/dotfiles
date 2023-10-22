return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = function()
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_lspconfig()
        lsp_zero.on_attach(function(_, bufnr)
            lsp_zero.default_keymaps({
                buffer = bufnr,
                preserve_mappings = false
            })
        end)
    end,
}
