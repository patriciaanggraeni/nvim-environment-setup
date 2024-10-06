local fn = vim.fn

local ensure_packer = function ()
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

    if fn.empty(fn.glob(install_path)) > 0 then
        print("Menginstall packer...")
        
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[ packadd packer.nvim ]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup( function (use)
    use 'wbthomason/packer.nvim'
    
    use 'williamboman/nvim-lsp-installer'
    use 'tfnico/vim-gradle'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/plenary.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'udalov/kotlin-vim'

    require('plugins.global.init').setup_lsp()
    require('plugins.global.init').setup_git()
    require('plugins.global.init').setup_tree()
    require('plugins.global.init').setup_telescope()

    -- require('plugins.global.coc').setup()
    if packer_bootstrap then
        require('packer').sync()
    end
end)
