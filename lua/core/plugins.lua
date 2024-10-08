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

        self:run_async('git', { 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', self.install_path }, function(success) 
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
    
    packer.init({
       display = {
           open_fn = function() 
               return require('packer.util').float({ border = 'rounded' })
           end,
           non_interactive = false,
           silent = true,
           keymap = {
               quit = 'q'
           },
           show_all_info = true,
       }
    })

    packer.startup( function(use) 
        use 'wbthomason/packer.nvim'
        use 'nvim-lua/plenary.nvim'

        -- colorscheme
        use { "catppuccin/nvim", as = "catppuccin" }

        
        require('core.themes')

        if packer_bootstrap then
            vim.defer_fn( function()
                packer.sync()
            end, 0)
        end
    end)
end

local manager = PackageManager:new({
    fn = vim.fn,
    install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
})

manager:init()
