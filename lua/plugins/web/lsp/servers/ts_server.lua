local capabilities = require('cmp_nvim_lsp').default_capabilities()
local M = {}

function M.setup()
    require('lspconfig').ts_ls.setup {
        capabilities = capabilities,
        cmd = {
            'C:\\Users\\yaraneru\\AppData\\Roaming\\npm\\typescript-language-server.cmd',
            '--stdio',
        },
        root_dir = vim.fn.getcwd(),
        settings = {
            documentFormatting = false,
            javascript = {
                format = { enable = true, },
            },
            typescript = {
                format = { enable = true, }
            },
        },
    }
end

return M