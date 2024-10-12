require('nvim-treesitter.configs').setup {
    ensure_installed = { 
        "javascript", "typescript", "java", "kotlin", 
        "html", "css", "scss", "vue", "python", "dart",
        "json", "yaml", "xml", "vue", "angular", "tsx",
        "markdown", "markdown_inline", "php", "sql", 
        "powershell", "gitignore", "gitcommit", "gitattributes",
        "git_rebase", "git_config"
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
        disable = {},
    },
    modules = {},
    ignore_install = {},
}
