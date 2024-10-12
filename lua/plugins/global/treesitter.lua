require('nvim-treesitter.configs').setup {
    ensure_installed = { "java", "kotlin" },
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
