local Themes = {}
Themes.__index = Themes

local success, packer = pcall(require, 'packer')
local Job = require('plenary.job')


function ThemesManager:new()
    local self = setmetatable({}, Themes)
    return self
end


ThemesManager.theme_list = {
    tokyonight = 'folke/tokyonight.nvim',
    gruvbox = 'morhetz/gruvbox',
    onedark = 'joshdick/onedark.vim',
}


function ThemesManager.install_theme(theme_name)
    local theme = self.theme_list[theme_name]

    if not theme then
        print('Tema ' .. theme .. ' tidak ditemukan!')
        return
    end

    if not success then
        print("Packer tidak ditemukan. Harap instal packer.nvim terlebih dahulu.")
        return
    end

    Job:new({
        command = 'nvim',
        args = { '-c', 'PackerSync' },
        on_exit = function(job, value)
            if value == 0 then
                print('Tema ' .. theme .. ' berhasil dipasang')
            else
                print('Tema ' .. theme .. ' gagal dipasang')
            end
        end
    }):start()

    packer.startup( function(use) 
        use(theme)
    end)
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


local function ChangeTheme(args)
    local theme = args.args
    local manager = ThemesManager:new()

    manager:setup_theme(theme)
end


vim.api.nvim_create_user_command('change-theme', ChangeTheme, { nargs = 1 })