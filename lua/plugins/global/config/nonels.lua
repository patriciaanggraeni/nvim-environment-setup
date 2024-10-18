local nonels = {
    'nvimtools/none-ls.nvim',
    lazy = true,
    config = function()
        require('null-ls').setup {
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.completion.spell,
                require("none-ls.diagnostics.eslint"),
            },
        }
    end
}

return nonels