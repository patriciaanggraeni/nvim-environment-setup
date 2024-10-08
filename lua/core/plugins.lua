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
   
    local packer_file = vim.fn.stdpath('config') .. '/lua/core/plugins.lua'
    local last_sync_file = vim.fn.stdpath('data') .. '/.packer_last_sync'

    local last_sync_time = vim.loop.fs_stat(last_sync_file) and vim.loop.fs_stat(last_sync_file).mtime.sec or 0
    local config_mod_time = vim.loop.fs_stat(packer_file) and vim.loop.fs_stat(packer_file).mtime.sec or 0

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
        use 'feline-nvim/feline.nvim'
        use { "catppuccin/nvim", as = "catppuccin" } 
        use { 'akinsho/toggleterm.nvim', tag = '*' }

                
        require('core.themes')
        require('plugins.global.tree')
        require('plugins.global.feline')
        require('plugins.global.telescope')
        require('plugins.global.toggleterm')
        if packer_bootstrap then
            vim.defer_fn( function()
                packer.sync()
            end, 0)
        end
    end)

    if config_mod_time > last_sync_time then
        print('Menjalankan sinkronasi plugins...')
        packer.sync()

        local file = io.open(last_sync_file, 'w')
        if file then
            file:write(os.time())
            file:close()
        end
    end
end

local manager = PackageManager:new({
    fn = vim.fn,
    install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
})

manager:init()
