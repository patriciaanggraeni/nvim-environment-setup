local notify = {
    'rcarriga/nvim-notify',
    config = function ()
        require("notify").setup {
            stages = "slide",
            timeout = 3000,
            render = "default",
            background_color = "#1C1C1C",
            border = "rounded",
        }

        vim.cmd [[
            highlight NotifyERRORBorder guifg=#FF6F61
            highlight NotifyWARNBorder guifg=#FFB347
            highlight NotifyINFOBorder guifg=#6EBE76
            highlight NotifyDEBUGBorder guifg=#A57CBA
            highlight NotifyTRACEBorder guifg=#7FB3D5l

            highlight NotifyERRORIcon guifg=#FF6F61
            highlight NotifyWARNIcon guifg=#FFB347
            highlight NotifyINFOIcon guifg=#6EBE76
            highlight NotifyDEBUGIcon guifg=#A57CBA
            highlight NotifyTRACEIcon guifg=#7FB3D5l

            highlight NotifyERRORTitle guifg=#FF6F61
            highlight NotifyWARNTitle guifg=#FFB347
            highlight NotifyINFOTitle guifg=#6EBE76
            highlight NotifyDEBUGTitle guifg=#A57CBA
            highlight NotifyTRACETitle guifg=#7FB3D5l
        ]]
    end,
}

return notify