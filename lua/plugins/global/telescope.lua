require('packer').use({
    'nvim-telescope/telescope.nvim',
    run = 'make',
    config = function()
        require('telescope').setup {
            defaults = { 
                vimgrep_arguments = {
                    'rg',
                    '--color=never',
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                    '--smart-case'
                },
                prompt_prefix = "> ",
                selection_caret = "> ",
                entry_prefix = "  ",
                initial_mode = "insert",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = { preview_width = 0.6 },
                    vertical = { preview_height = 0.5 },
                },
                file_ignore_patterns = {},
                generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
                path_display = {"truncate"},
                winblend = 0,
                border = {},
                -- borderchars = {'-', '|', '-', '|', '+', '+', '+', '+'}, 
                color_devicons = true,
                use_less = true,
                set_env = { ['COLORTERM'] = 'truecolor' },
                file_previewer   = require'telescope.previewers'.vim_buffer_cat.new,
                grep_previewer   = require'telescope.previewers'.vim_buffer_vimgrep.new,
                qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
            },
        }
    end,
})
