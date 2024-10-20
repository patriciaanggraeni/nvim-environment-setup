vim.g.mapleader = '/'
vim.g.localmapleader = '/'

local telescope = require("telescope.builtin")

local set_keymap = function(mode, keys, command, opts)
    opts = vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
    return vim.keymap.set(mode, keys, command, opts)
end

local toggle_term_command = function()
    if vim.fn.mode() == 't' then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
    end
    vim.cmd('ToggleTerm')
end

local toggle_close_terminal = function()
    vim.cmd('ToggleTerm')
end

local keymaps = {

    -- normal mode
    { mode = 'n', keys = '<leader>x', command = '"+d$' },
    { mode = 'n', keys = '<leader>c', command = '"+y$' },
    { mode = 'n', keys = '<leader>v', command = '"+p' },

    { mode = 'n', keys = '<leader>s', command = ':w<CR>' },
    { mode = 'n', keys = '<leader>q', command = ':q<CR>' },
    { mode = 'n', keys = '<leader>S', command = ':wq<CR>' },

    { mode = 'n', keys = '<leader>z', command = 'u' },
    { mode = 'n', keys = '<leader>y', command = '<C-r>' },
    { mode = 'n', keys = '<leader>a', command = 'ggVG' },

    { mode = 'n', keys = '<leader>H', command = ':split<CR>' },
    { mode = 'n', keys = '<leader>V', command = ':vsplit<CR>' },
    { mode = 'n', keys = '<leader>Q', command = ':close<CR>' },

    { mode = 'n', keys = '<leader>k', command = '<C-w>k' },
    { mode = 'n', keys = '<leader>j', command = '<C-w>j' },
    { mode = 'n', keys = '<leader>h', command = '<C-w>h' },
    { mode = 'n', keys = '<leader>l', command = '<C-w>l' },

    { mode = 'n', keys = '<leader>/', command = '/' },
    { mode = 'n', keys = '<leader>R', command = ':%s/\\<<C-r><C-w>\\>/' },

    { mode = 'n', keys = '<leader>b', command = ':NvimTreeToggle<CR>' },
    { mode = 'n', keys = '<leader>e', command = ':NvimTreeFocus<CR>' },
    { mode = 'n', keys = '<leader>w', command = '<C-w>w' },

    { mode = 'n', keys = '<leader>fg', command = telescope.find_files, opts = { desc = 'Live Grep' } },
    { mode = 'n', keys = '<leader>ff', command = telescope.find_files, opts = { desc = 'Find File' } },
    { mode = 'n', keys = '<leader>fb', command = function()
        require('telescope').extensions.file_browser.file_browser()
    end, opts = { desc = 'File Browser' } },

    { mode = 'n', keys = '<leader>t', command = toggle_term_command },

    { mode = 'n', keys = '<leader>ls', command = ':lua lazy_sync()<CR>', opts = { noremap = true, silent = true } },

    { mode = 'v', keys = '<leader>x', command = '"+d' },
    { mode = 'v', keys = '<leader>c', command = '"+y' },
    { mode = 'v', keys = '<leader>d', command = 'd' },

    -- terminal mode
    { mode = 't', keys = '<esc>', command = [[ <C-\><C-n> ]] },
    { mode = 't', keys = '<leader>q', command = toggle_close_terminal, opts = { noremap = true, silent = true } },

    -- insert mode
    -- { mode = 'i', keys = '<leader>t', command = "cmp.mapping.select_next_item()" },
    -- { mode = 'i', keys = '<leader>y', command = "cmp.mapping.select_prev_item()" },
    -- { mode = 'i', keys = '<leader><Space>', command = "cmp.mapping.complete()" },
    -- { mode = 'i', keys = '<CR>', command = "cmp.mapping.confirm({ select = true }) },
}

-- set keymaps
for _, map in ipairs(keymaps) do
    set_keymap(map.mode, map.keys, map.command, map.opts)
end
