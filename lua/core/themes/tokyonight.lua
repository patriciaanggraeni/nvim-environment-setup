require('tokyodark').setup({
    opts = {
        transparent_background = true,
        gamma = 1.00,
        styles = {
            comments = { italic = false },
            keywords = { italic = false },
            identifiers = { italic = false },
            functions = { italic = false },
            variables = { italic = false },
        },
        no_italic = true,
        terminal_colors = true,
    },
})

vim.cmd [[ colorscheme tokyodark ]]
