local capabilities = require('cmp_nvim_lsp').default_capabilities()
local M = {}

function M.setup()
    require('lspconfig').kotlin_language_server.setup {
        capabilities = capabilities,
        cmd = {
            "C:\\Users\\yaraneru\\AppData\\Local\\nvim-data\\lsp_servers\\kotlin\\server\\bin\\kotlin-language-server.bat"
        },
        filetypes = { "kotlin" },
        root_dir = vim.fn.getcwd(),
        settings = {
            kotlin = {
                compiler = {
                    version = '2.0.20',
                    jvmTarget = '1.8',
                },
                lint = {
                    enable = true,
                },
                completion = {
                    enable = true,
                },
                formatting = {
                    enable = true,
                },
            }
        },
        trace = { server = 'verbose' },
    }
end

return M
