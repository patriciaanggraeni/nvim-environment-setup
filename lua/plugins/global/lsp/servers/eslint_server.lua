local capabilities = require('cmp_nvim_lsp').default_capabilities()
local M = {}

function M.setup()
    require('lspconfig').eslint.setup {
        capabilities = capabilities,
        root_dir = vim.fn.getcwd(),
    }
end

return M
