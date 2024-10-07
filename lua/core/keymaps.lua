vim.g.mapleader = '/'
vim.g.localmapleader = '/'

-- local telescope = require("telescope.builtin")
local M = {}

local set_keymap = function(mode, keys, command, opts)
    opts = opts or {}
    opts.noremap = opts.noremap ~= true
    opts.silent = opts.silent ~= true
    
    return vim.keymap.set(mode, keys, command, opts)
end

-- normal mode
set_keymap('n', '<leader>x', '"+d$') -- cut
set_keymap('n', '<leader>c', '"+y$') -- copy
set_keymap('n', '<leader>v', '"+p')  -- paste

set_keymap('n', '<leader>z', 'u')     -- undo
set_keymap('n', '<leader>y', '<C-r>') -- redo

set_keymap('n', '<leader>s', ':w<CR>')  -- save
set_keymap('n', '<leader>q', ':q<CR>')  -- quit
set_keymap('n', '<leader>S', ':wq<CR>') -- save & quit

set_keymap('n', '<leader>H', ':split<CR>') -- split horizontally
set_keymap('n', '<leader>V', ':vsplit<CR>') -- split vertically
set_keymap('n', '<leader>Q', ':close<CR>')  -- close current split

set_keymap('n', '<leader>k', '<C-w>k') -- nav to window up
set_keymap('n', '<leader>j', '<C-w>j') -- nav to window down
set_keymap('n', '<leader>h', '<C-w>h') -- nav to window left
set_keymap('n', '<leader>l', '<C-w>l') -- nav to window right

set_keymap('n', '<leader>/', '/') -- text search
set_keymap('n', '<leader>R', ':%s/\\<<C-r><C-w>\\>/') -- change word on cursor hover

set_keymap('n', '<leader>b', ':NvimTreeToggle<CR>')
set_keymap('n', '<leader>e', ':NvimTreeFocus<CR>')
set_keymap('n', '<leader>w', '<C-w>w')

-- set_keymap('n', '<leader>fg', telescope.find_files, { desc = "Live Grep" })
-- set_keymap('n', '<leader>ff', telescope.find_files, { desc = "Find File" })

-- visual mode
set_keymap('v', '<leader>x', '"+d') -- cut
set_keymap('v', '<leader>c', '"+y') -- copy

-- insert mode
-- set_keymap('i', '<leader>t', "cmp.mapping.select_next_item()", { noremap = true, silent = true })
-- set_keymap('i', '<leader>y', "cmp.mapping.select_prev_item()", { noremap = true, silent = true })
-- set_keymap('i', '<leader><Space>', "cmp.mapping.complete()", { noremap = true, silent = true })
-- set_keymap('i', '<CR>', "cmp.mapping.confirm({ select = true })", { noremap = true, silent = true })

return M