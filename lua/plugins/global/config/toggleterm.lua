local toggleterm = {
    'akinsho/toggleterm.nvim',
    lazy = true,
    config = function ()
        require("toggleterm").setup {
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
                return 20
            end,
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
            direction = 'vertical',
            close_on_exit = true,
            shell = 'pwsh.exe -NoLogo',
            float_opts = {
                border = 'single',
                width = 100,
                height = 50,
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