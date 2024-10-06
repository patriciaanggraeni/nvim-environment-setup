local lsp = require('lspconfig')

local M = {}

function M.setup_kotlin_lsp()
    lsp.kotlin_language_server.setup {
        cmd = {"C:\\Users\\yaraneru\\AppData\\Local\\nvim-data\\lsp_servers\\kotlin\\server\\bin\\kotlin-language-server.bat"},
        filetypes = {"kotlin"},
        root_dir = lsp.util.root_pattern("settings.gradle", "settings.gradle.kts", ".git"),
        settings = {
            kotlin = {
                compiler = {
                    version = "2.0.20",
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
        capabilities = {
            textDocument = {
                completion = {
                    completionItem = {
                        snippetSupport = true
                    }
                }
            }
        },
        trace = { server = "verbose" }
    }
end

return M
