local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.lua_ls.setup {
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

lspconfig.html.setup {
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

lspconfig.cssls.setup {
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

lspconfig.jsonls.setup {
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

lspconfig.eslint.setup {
    capabilities = capabilities,
    root_dir = vim.fn.getcwd(),
}

lspconfig.ts_ls.setup {
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

lspconfig.marksman.setup {
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
