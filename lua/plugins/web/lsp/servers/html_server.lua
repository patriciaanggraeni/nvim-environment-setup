local capabilities = require('cmp_nvim_lsp').default_capabilities()
local M = {}

function M.setup()
    require('lspconfig').html.setup {
        capabilities = capabilities,
        cmd = {
            'C:\\Users\\yaraneru\\AppData\\Roaming\\npm\\vscode-html-language-server.cmd', 
            '--stdio',
        },
        filtypes = { 'html', 'blade', 'php', 'js', 'jsx', 'tsx' },
        root_dir = vim.fn.getcwd(),
        settings = {
            html = {
                format = {
                    wrapAttributes = 'auto',
                },
            },
        },
    }
end

return M