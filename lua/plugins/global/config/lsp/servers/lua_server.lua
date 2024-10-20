local capabilities = require('cmp_nvim_lsp').default_capabilities()
local M = {}

function M.setup()
    require('lspconfig').lua_ls.setup {
        capabilities = capabilities,
        settings = {
            Lua = {
                cmd = {
                   'C:\\Users\\yaraneru\\scoop\\apps\\lua-language-server\\3.11.0\\bin\\lua-language-server.exe' 
                },
                runtime = {
                    version = '5.1',
                },
                diagnostics = {
                    globals = { 'vim', },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = {
                    enable = false,
                },
            },
        },
        root_dir = vim.fn.getcwd(),
    } 
end

return M