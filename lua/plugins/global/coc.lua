local set_keymap = require('core.keymaps')

local M = {}

function M.setup()
    vim.g.coc_global_extensions = {
        -- android dev
        'coc-xml',
        'coc-java',
        'coc-kotlin',
        'coc-flutter',
        'coc-tsserver',

        -- global coc
        'coc-json',
        'coc-eslint',
        'coc-prettier',
        'coc-markdownlint',
    }

    -- set keymaps khusus coc
    set_keymap('i', '<leader><Space>', 'coc#refresh()', { silent = true })
    set_keymap('n', '<leader>gd', '<Plug>(coc-definition)', { silent = true })
    set_keymap('n', '<leader>gr', '<Plug>(coc-references)', { silent = true })
end

return M
