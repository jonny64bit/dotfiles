return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        { 'L3MON4D3/LuaSnip' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },
        "copilot.lua"
    },
    config = function()
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_cmp()

        local cmp = require('cmp')
        local cmp_format = lsp_zero.cmp_format()

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
                ['<C-j>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
            }),
            preselect = 'item',
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            sources = {
                { name = 'copilot' },
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
            },
            --- (Optional) Show source name in completion menu
            formatting = cmp_format,
        })

        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        })
    end
}
