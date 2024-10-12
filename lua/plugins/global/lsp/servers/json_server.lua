local capabilities = require('cmp_nvim_lsp').default_capabilities()
local M = {}

function M.setup()
    require('lspconfig').jsonls.setup {
        capabilities = capabilities,
        cmd = {
            'C:\\Users\\yaraneru\\AppData\\Roaming\\npm\\vscode-json-language-server.cmd', 
            '--stdio',
        },
        root_dir = vim.fn.getcwd(),
        settings = {
            json = {
                schemas = {
                    {
                        fileMatch = { 'package.json' },
                        url = 'http://json.schemastore.org/package.json',
                    }
                },
            },
        },
    }
end

return M