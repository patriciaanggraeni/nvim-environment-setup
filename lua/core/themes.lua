local Themes = {}

function Themes.install()
    return {
        { 'catppuccin/nvim', lazy = false },
        { 'navarasu/onedark.nvim', lazy = false },
        { 'tiagovla/tokyodark.nvim', lazy = false },
    }
end

function Themes.load_theme()
    require('themes.catppuccin')
end

return Themes