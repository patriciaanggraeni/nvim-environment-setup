local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazy_path) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git","--branch=stable",
        lazy_path,
      })
end

vim.opt.rtp:prepend(lazy_path)

require('lazy').setup({
    { 'tpope/vim-fugitive', lazy = false },
    { 'nvim-lua/plenary.nvim', lazy = false },
    { 'nvim-tree/nvim-tree.lua', lazy = false },
    { 'feline-nvim/feline.nvim', lazy = true, event = "BufRead" },
    { 'neovim/nvim-lspconfig', lazy = true, event = "BufReadPre" },
    { 'petertriho/cmp-git', lazy = true, event = "InsertEnter" },
    { 'williamboman/nvim-lsp-installer', lazy = true, event = "BufReadPre" },
    { 'nvim-telescope/telescope.nvim', lazy = true, event = "CmdlineEnter" },
    { 'nvim-treesitter/nvim-treesitter', lazy = true },
    {
        'hrsh7th/nvim-cmp',
        lazy = true,
        event = "InsertEnter",
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp', lazy = true, event = "InsertEnter" },
            { 'hrsh7th/cmp-buffer', lazy = true, event = "InsertEnter" },
            { 'hrsh7th/cmp-path', lazy = true, event = "InsertEnter" },
            { 'hrsh7th/cmp-cmdline', lazy = true, event = "CmdlineEnter" },
        }
    },
    { 'catppuccin/nvim', lazy = false },
    { 'L3MON4D3/LuaSnip', lazy = true, event = "InsertEnter" },
    { 'akinsho/toggleterm.nvim', lazy = true, cmd = "ToggleTerm" },
    
    
    require('plugins.global.cmp'),
    require('plugins.global.tree'),
    require('plugins.global.feline'),
    require('plugins.global.telescope'),
    require('plugins.global.toggleterm'),
    require('plugins.global.treesitter')
})

require('core.themes')
require('plugins.global.lsp.init')

vim.cmd([[ autocmd User LazyDone ++once lua require('lazy').sync() ]])