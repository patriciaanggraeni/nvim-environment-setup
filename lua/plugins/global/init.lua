local M = {}

function M.setup_plugins()
    return {
        { require('plugins.global.config.cmp') },
        { require('plugins.global.config.tree') },
        { require('plugins.global.config.nonels') },
        { require('plugins.global.config.lualine') },
        { require('plugins.global.config.autopairs') },
        { require('plugins.global.config.telescope') },
        { require('plugins.global.config.toggleterm') },
        { require('plugins.global.config.treesitter') },
    }
end

function M.initializing_lsp()
    return {
        { require('plugins.global.lsp.init') },
    } 
end

return M