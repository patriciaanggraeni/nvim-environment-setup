local Themes = {}

function Themes.install()
    return {
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
    }
end

function Themes.load_theme()
    require('lua.themes.onedark')
end

return Themes