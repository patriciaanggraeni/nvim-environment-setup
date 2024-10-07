local lsp = require('lspconfig')
local cmp = require('cmp_nvim_lsp')
local protocol = vim.lsp.protocol

local M = {}

local capabilities = protocol.make_client_capabilities()
capabilities = cmp.default_capabilities(capabilities)

function M.setup_kotlin_lsp()
    lsp.kotlin_language_server.setup {
        capabilities = capabilities,
        cmd = {
            "C:\\Users\\yaraneru\\AppData\\Local\\nvim-data\\lsp_servers\\kotlin\\server\\bin\\kotlin-language-server.bat"
        },
        filetypes = {'kotlin'},
        root_dir = lsp.util.root_pattern('settings.gradle.kts', 'build.gradle.kts', '.git', 'src'),
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


function M.setup_lua()
    lsp.lua_ls.setup {
        capabilities = capabilities,
        cmd = {
            "C:\\Users\\yaraneru\\AppData\\Local\\nvim-data\\lsp_servers\\sumneko_lua\\extension\\server\\bin\\lua-language-server.exe"
        },
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
        trace = { server = 'verbose' },
    }
end

return M
