local Plugins = {}

function Plugins.install_global_plugins()
    return {
        { 'nvim-lua/plenary.nvim' },
        { 'nvimtools/none-ls.nvim' },
        { 'nvim-tree/nvim-tree.lua' },
        { 'nvim-telescope/telescope.nvim' },
        { 'akinsho/toggleterm.nvim', cmd = 'ToggleTerm' },
        { 'nvim-treesitter/nvim-treesitter', event = { 'BufReadPre', 'BufNewFile' } },
        { 'windwp/nvim-autopairs', event = 'InsertEnter' },
        { 'neovim/nvim-lspconfig', event = 'BufReadPre' },
        { 'williamboman/nvim-lsp-installer', event = 'BufReadPre' },
        { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
        { 'tpope/vim-fugitive', event = 'BufNewFile' },
        { 'petertriho/cmp-git', event = 'InsertEnter' },
        { 'lewis6991/gitsigns.nvim', event = { 'BufReadPre', 'BufNewFile' } },
        { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
        { 'rcarriga/nvim-notify' },
        { 'numToStr/Comment.nvim' },
        {
            'hrsh7th/nvim-cmp',
            event = 'InsertEnter',
            dependencies = {
                { 'hrsh7th/cmp-nvim-lsp', event = 'InsertEnter' },
                { 'hrsh7th/cmp-buffer', event = 'InsertEnter' },
                { 'hrsh7th/cmp-path', event = 'InsertEnter' },
                { 'hrsh7th/cmp-cmdline', event = 'CmdlineEnter' },
                { 'L3MON4D3/LuaSnip', event = 'InsertEnter' },
            }
        },
    }
end

function Plugins.setup_global_plugins()
    return {
        { require('plugins.global.config.cmp') },
        { require('plugins.global.config.tree') },
        { require('plugins.global.config.notify') },
        { require('plugins.global.config.nonels') },
        { require('plugins.global.config.lualine') },
        { require('plugins.global.config.comment') },
        { require('plugins.global.config.gitsigns') },
        { require('plugins.global.config.autopairs') },
        { require('plugins.global.config.blankline') },
        { require('plugins.global.config.telescope') },
        { require('plugins.global.config.treesitter') },
        { require('plugins.global.config.toggleterm') },
    }
end

function Plugins.initializing_lsp()
    require('plugins.global.config.lsp.lsp')
end

return Plugins
