require('utils.init').init()

require('packer').startup( function(use) 

    use { 'neoclide/coc.nvim', branch = 'release' }

    require('plugins.global.coc').setup()
end)
