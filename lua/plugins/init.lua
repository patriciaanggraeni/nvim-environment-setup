local Plugins = {}

function Plugins.install_core_plugins()
    return {
        { 'nvim-lua/plenary.nvim', lazy = true },
        { 'nvim-tree/nvim-tree.lua', lazy = true },
        { 'nvim-telescope/telescope.nvim', lazy = true },
        { 'nvim-treesitter/nvim-treesitter', lazy = true },
        { 'akinsho/toggleterm.nvim', lazy = true, cmd = "ToggleTerm" },
        { 'windwp/nvim-autopairs', lazy = true, event = 'InsertEnter' },
        { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} }
    }
end

function Plugins.install_lsp_plugins()
    return {
        { 'nvimtools/none-ls.nvim', lazy = true },
        { 'neovim/nvim-lspconfig', lazy = true, event = "BufReadPre" },
        { 'williamboman/nvim-lsp-installer', lazy = true, event = "BufReadPre" },
    }
end

function Plugins.install_git_plugins()
    return {
        { 'tpope/vim-fugitive', lazy = true },
        { 'petertriho/cmp-git', lazy = true, event = "InsertEnter" },
    }
end

function Plugins.install_statusline_plugins()
    return {
        { 'feline-nvim/feline.nvim', lazy = true, event = "BufRead" },
        { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
    }
end

function Plugins.install_autocompletion_plugins()
    return {
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
    }
end

return Plugins