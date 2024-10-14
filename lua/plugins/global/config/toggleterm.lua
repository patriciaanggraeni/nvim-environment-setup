local toggleterm = {
    'akinsho/toggleterm.nvim',
    lazy = true,
    config = function ()
        require("toggleterm").setup {
            size = 10,
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            shade_filetypes = {},
            autochdir = true,
            auto_scroll = true,
            shade_terminals = true,
            shading_factor = '2',
            start_in_insert = true,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = false,
            direction = 'float',
            close_on_exit = true,
            shell = 'pwsh.exe -NoLogo',
            float_opts = {
                border = 'curved',
                width = 100,
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                }
            }
        }
    end,
}

return toggleterm