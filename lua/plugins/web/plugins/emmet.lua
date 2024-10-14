local emmet = {
    'mattn/emmet-vim',
    lazy = true,
    ft = { 'html', 'css', 'jvascript', 'typescript' },
    config = function ()
        vim.g.user_emmet_install_global = 0
        vim.g.user_emmet_leader_key = 'i'
        
        vim.cmd [[
             autocmd FileType html,css,javascript,typescript,javascriptreact,typescriptreact EmmetInstall
        ]]
    end
}

return emmet