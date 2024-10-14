local capabilities = require('cmp_nvim_lsp').default_capabilities()
local M = {}

function M.setup()
    require('lspconfig').cssls.setup {
        capabilities = capabilities,
        cmd = {
            'C:\\Users\\yaraneru\\AppData\\Roaming\\npm\\vscode-css-language-server.cmd', 
            '--stdio',
        },
        filtypes = { 'css', 'scss', 'less' },
        root_dir = vim.fn.getcwd(),
        settings = {
            css = {
                validate = true,
            },
        },
    }
end

return M