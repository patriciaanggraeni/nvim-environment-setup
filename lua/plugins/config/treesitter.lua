local treesitter =  {
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = { 
                "javascript", "typescript", "java", "kotlin", 
                "html", "css", "scss", "vue", "python", "dart",
                "json", "yaml", "xml", "angular", "tsx",
                "markdown", "markdown_inline", "php", "sql",
                "powershell", "gitignore", "gitcommit", "gitattributes",
                "git_rebase", "git_config"
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                disable = { 'lua' },
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
                disable = {},
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
            },
            modules = {},
            ignore_install = { 'lua' },
        }
    end,
}

return treesitter