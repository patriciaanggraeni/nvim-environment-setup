local capabilities = require('cmp_nvim_lsp').default_capabilities()
local M = {}

function M.setup()
    require('lspconfig').marksman.setup {
        capabilities = capabilities,
        cmd = {
            'C:\\Users\\yaraneru\\scoop\\apps\\marksman\\2024-10-07\\marksman.exe',
            'server',
        },
        filetypes = { 'markdown' },
        root_dir = vim.fn.getcwd(),
        settings = {
            markdown = {
                lint = { enable = true, },
                completion = { enable = true, },
            },
        },
    }
end

return M