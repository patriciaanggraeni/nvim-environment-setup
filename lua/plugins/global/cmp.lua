local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'luasnip' }
    },
    formatting = {
        format = lspkind.cmp_format({ 
            mode = 'symbol_text',
            with_text = true,
            maxwidth = 50,
            ellipsis_char = '...',
            menu = {
                nvim_lsp = "[LSP]",
                buffer = "[Buffer]",
                path = "[Pacth]",
                luasnip = "[Snippet]",
            },
        })
    },
})
