return {
    'williamboman/mason-lspconfig.nvim',
    config = function()
        local lsp_zero = require('lsp-zero')
        require('mason-lspconfig').setup({
            handlers = {
                lsp_zero.default_setup,
            },
        })
    end
}
