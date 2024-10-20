local telescope = {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    config = function()
        local telescope = require('telescope')
        local action = require('telescope.actions')
        local file_brower = require('telescope').extensions.file_browser

        telescope.setup {
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
                    horizontal = {
                        prompt_position = 'top',
                    },
                    vertical = {
                        prompt_position = 'top',
                    },
                },
                file_ignore_patterns = {},
                generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
                path_display = {"truncate"},
                winblend = 0,
                border = {},
                color_devicons = true,
                use_less = true,
                set_env = { ['COLORTERM'] = 'truecolor' },
                file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
                grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
                qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
            },
            extensions = {
                file_browser = {
                    theme = 'dropdown',
                    hijack_netrw = true,
                    mappings = {
                        ['n'] = {
                            ['<leader>n'] = file_brower.actions.create,
                            ['<leader>\\'] = file_brower.actions.goto_parent_dir,
                            ['/'] = function ()
                                vim.cmd [[ startinsert ]]
                            end,
                            ['<leader>u'] = function (prompt)
                                for i = 1, 10 do
                                    action.move_selection_previous(prompt)
                                end
                            end,
                            ['<leader>i'] = function (prompt)
                                for i = 1, 10 do
                                    action.move_selection_next(prompt)
                                end
                            end,
                            ['<PageUp>'] = action.preview_scrolling_up,
                            ['<PageDown>'] = action.preview_scrolling_down
                        },
                    },
                },
            },
        }

        require('telescope').load_extension('file_browser')
    end,
}

return telescope
