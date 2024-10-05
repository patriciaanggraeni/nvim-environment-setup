local set_keymap = require('utils.init').keymaps.init()

vim.g.mapleader = '/'
vim.g.localmapleader = '/'

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

-- visual mode
set_keymap('v', '<leader>x', '"+d') -- cut
set_keymap('v', '<leader>c', '"+y') -- copy

-- insert mode
