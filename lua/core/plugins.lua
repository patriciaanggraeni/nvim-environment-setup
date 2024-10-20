local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { require('core.themes').install() },
        
        { require('plugins.global.global').install_global_plugins() },
        { require('plugins.web.web').install_web_plugins() },

        { require('plugins.global.global').setup_global_plugins() },
        { require('plugins.web.web').setup_web_plugins() },
    },
    checker = { enabled = true },
})

require('core.themes').load_theme()
require('plugins.global.global').initializing_lsp()
