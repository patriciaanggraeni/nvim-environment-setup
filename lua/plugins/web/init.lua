local M = {}

function M.setup_plugins()
    return {
        { require('lua.plugins.web.plugins.emmet') },
    }
end

function M.initializing_lsp()
    return {
        { require('lua.plugins.web.lsp.init') },
    }
end

return M