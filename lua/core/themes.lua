local Themes = {}
Themes.__index = Themes

local success, packer = pcall(require, 'packer')
local Job = require('plenary.job')

function ThemesManager:new()
    local self = setmetatable({}, Themes)

    self.new_theme = false
    self.installed_themes = {}
    self.theme_list = {
        tokyonight = 'folke/tokyonight.nvim',
        gruvbox = 'morhetz/gruvbox',
        onedark = 'joshdick/onedark.vim',
    }

    return self
end

function ThemesManager.install_theme()
    local themes = self.theme_list

    if not success then
        print("Packer tidak ditemukan. Harap instal packer.nvim terlebih dahulu.")
        return
    end

    for theme in pairs(themes) do
        if self.installed_themes[theme] == nil then
            self.installed_themes[theme] = false
        end
    end

    local new_theme = self.new_theme
    for theme, _ in pairs(themes) do
        if self.installed_themes[theme] == nil then
            new_theme = true
            break
        end
    end

    if new_theme then
        packer.startup( function(use) 
            for _, theme in pairs(themes) do
                use(theme)
            end
        end)
    
        Job:new({
            command = 'nvim',
            args = { '-c', 'PackerSync' },
            on_exit = function(job, value)
                if value == 0 then
                    for theme in pairs(themes) do
                        self.installed_themes[theme] = true
                    end
                    print('Semua tema berhasil dipasang.')
                else
                    print('Gagal memasang tema.')
                end
            end
        }):start()
    else
        print('Berhasil melakukan sinkronisasi tema.')
    end
end

function ThemesManager:setup_theme(theme_name)
    local theme = self.theme_list[theme_name]

    if not theme then
        print('Tema ' .. theme .. ' tidak ditemukan!')
        return
    end

    if not success then
        print("Packer tidak ditemukan. Harap instal packer.nvim terlebih dahulu.")
        return
    end

    vim.cmd('colorscheme ' .. theme)
    print('Tema berhasil diatur ke ' .. theme)
end

local manager = ThemesManager:new()
manager:install_theme()

vim.api.nvim_create_user_command('change-theme', 
    function(args) 
        local theme = args.args
        manager:setup_theme(theme)
    end, 
{ nargs = 1 })