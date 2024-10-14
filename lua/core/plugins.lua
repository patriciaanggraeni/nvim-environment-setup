local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazy_path) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git","--branch=stable",
        lazy_path,
      })
end

vim.opt.rtp:prepend(lazy_path)

require('lazy').setup({
    require('plugins.init').install_core_plugins(),
    require('plugins.init').install_lsp_plugins(),
    require('plugins.init').install_git_plugins(),
    require('plugins.init').install_statusline_plugins(),
    require('plugins.init').install_autocompletion_plugins(),

    -- install themes
    require('core.themes').install(),

    -- global plugins
    require('plugins.global.init').setup_plugins(),

    -- web development plugins
    require('plugins.web.init').setup_plugins(),

    -- android development plugins
    require('plugins.android.init').setup_plugins(),
})

require('core.themes').load_theme()

require('plugins.global.init').initializing_lsp()
require('plugins.web.init').initializing_lsp()
require('plugins.android.init').initializing_lsp()

vim.cmd([[ autocmd User LazyDone ++once lua require('lazy').sync() ]])