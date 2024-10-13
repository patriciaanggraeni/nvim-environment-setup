require('onedark').setup({
    style = "darker",
    transparent = true,
    term_colors = true,
    ending_tildes = false,
    cmp_itemkind_reverse = false,
    code_style = {
        comments = 'none',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none',
    },
    diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
    },
})

vim.cmd [[ colorscheme onedark ]]
