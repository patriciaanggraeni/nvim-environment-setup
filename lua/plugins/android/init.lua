local M = {}

function M.setup_plugins()

end

function M.initializing_lsp()
    return {
        { require('plugins.android.lsp.init') },
    }
end

return M