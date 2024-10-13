local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazy_path) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git","--branch=stable",
        lazy_path,
      })
end

vim.opt.rtp:prepend(lazy_path)

require('lazy').setup({
    -- basic plugins
    { 'nvim-lua/plenary.nvim', lazy = false },
    { 'nvim-tree/nvim-tree.lua', lazy = false },
    { 'nvim-telescope/telescope.nvim', lazy = true },
    { 'nvim-treesitter/nvim-treesitter', lazy = true },

    -- lsp plugins
    { 'neovim/nvim-lspconfig', lazy = true, event = "BufReadPre" },
    { 'williamboman/nvim-lsp-installer', lazy = true, event = "BufReadPre" },
    
    -- git integraton plugins
    { 'tpope/vim-fugitive', lazy = false },
    { 'petertriho/cmp-git', lazy = true, event = "InsertEnter" },

    -- statusline plugins
    { 'feline-nvim/feline.nvim', lazy = true, event = "BufRead" },
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
    
    -- autocompletion plugins
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
    { 'L3MON4D3/LuaSnip', lazy = true, event = "InsertEnter" },
    
    -- terminal plugins
    { 'akinsho/toggleterm.nvim', lazy = true, cmd = "ToggleTerm" },

    -- colorschemes
    { 'catppuccin/nvim', lazy = false },
    { 'navarasu/onedark.nvim', lazy = false },
    { 'tiagovla/tokyodark.nvim', lazy = false },
    { 'Tsuzat/NeoSolarized.nvim', lazy = false },
    { 'oxfist/night-owl.nvim', lazy = false },
    { 'bluz71/vim-nightfly-colors', lazy = false },
    { 'jaredgorski/spacecamp', lazy = false },
    { 'zenbones-theme/zenbones.nvim', lazy = false },
    { 'diegoulloao/neofusion.nvim', lazy = false },
    { 'maxmx03/fluoromachine.nvim', lazy = false },

    -- active plugins
    require('plugins.global.cmp'),
    require('plugins.global.tree'),
    require('plugins.global.lualine'),
    require('plugins.global.telescope'),
    require('plugins.global.toggleterm'),
    require('plugins.global.treesitter')
    
    -- nonactive plugins
    -- require('plugins.global.feline'),
})

require('core.themes.onedark')
require('plugins.global.lsp.init')

vim.cmd([[ autocmd User LazyDone ++once lua require('lazy').sync() ]])