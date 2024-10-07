local M = {}

function M.setup_lsp()
    require('lsp.lsp').setup_lua()
    require('lsp.lsp').setup_kotlin_lsp()
end

function M.setup_tree()
    require('plugins.global.tree').setup()
end

function M.setup_telescope()
    require('plugins.global.telescope').setup()
end

function M.setup_git()
    require('plugins.global.git').setup()
end

return M
