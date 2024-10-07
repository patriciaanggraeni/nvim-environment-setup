local PackageManager = {}
PackageManager.__index = PackageManager

function PackageManager:new(param)
    local self = setmetatable({}, PackageManager)

    self.fn = param.fn or vim.fn
    self.install_path = param.install_path or self.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

    return self
end

function PackageManager:run_async(command, args, callback)
    local Job = require('plenary.job')

    Job:new({
        command = command,
        args = args,
        on_exit = function(job, value)
            callback(value == 0)
        end
    }):start()
end

function PackageManager:ensure_packer()
    if self.fn.empty(self.fn.glob(self.install_path)) > 0 then
        print('Menginstall packer...')

        self:run_async('git', { 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }, function(success) 
            if success then 
                vim.cmd[[ packadd packer.nvim ]]
                print('Berhasil menginstall packer.')
            else 
                print('Gagal menginstall packer.')
            end
        end)

        return true
    end

    return false
end

function PackageManager:init()
    local packer_bootstrap = self:ensure_packer()
    local success, packer = pcall(require, 'packer')

    if not success then 
        print("Packer tidak ditemukan. Harap instal packer.nvim terlebih dahulu.")
        return
    end

    packer.startup( function(use) 
        use 'wbthomason/packer.nvim'

        

        if packer_bootstrap then
            packer.sync()
        end
    end)
end

local manager = PackageManager:new({
    fn = vim.fn,
    install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
})

manager:init()

-- require('packer').startup( function (use)
--     use 'wbthomason/packer.nvim'

--     use 'williamboman/nvim-lsp-installer'
--     use 'tfnico/vim-gradle'
--     use 'neovim/nvim-lspconfig'
--     use 'nvim-lua/plenary.nvim'
--     use 'lewis6991/gitsigns.nvim'
--     use 'udalov/kotlin-vim'
    
--     -- cmp plugins
--     use 'hrsh7th/nvim-cmp'
--     use 'hrsh7th/cmp-cmdline'
--     -- use 'hrsh7th/cmp-nvim-lsp'
--     use 'hrsh7th/cmp-buffer'
--     use 'hrsh7th/cmp-path'
--     use 'saadparwaiz1/cmp_luasnip'
    
--     -- snippet plugins
--     use 'L3MON4D3/LuaSnip'
--     use 'rafamadriz/friendly-snippets'
    

--     -- use 'onsails/lspkind-nvim'

--     require('plugins.global.init').setup_lsp()
--     require('plugins.global.init').setup_git()
--     require('plugins.global.init').setup_tree()
--     require('plugins.global.init').setup_telescope()

--     -- require('plugins.global.coc').setup()
--     if packer_bootstrap then
--         require('packer').sync()
--     end
-- end)
