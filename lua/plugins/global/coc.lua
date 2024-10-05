local set_keymap = require('lua.utils.init').keymaps.init()

local M = {}

function M.setup()
    vim.g.coc_global_extensions = {
        -- web dev
        'coc-html',
        'coc-css',
        'coc-tsserver',
        'coc-phpls',
        'coc-vue',
        'coc-angular',

        -- android dev
        'coc-java',
        'coc-kotlin',
        'coc-flutter',
        'coc-xml',

        -- other
        'coc-go',
        'coc-pyright',
        'coc-json',
        'coc-eslint',
        'coc-prettier',
        'coc-markdownlint',
    }

    -- set keymaps khusus coc
    set_keymap('i', '<leader><Space>', 'coc#refresh()', { silent = true })
end

return M
