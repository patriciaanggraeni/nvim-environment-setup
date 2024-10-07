local set = vim.opt

-- general config
set.mouse = ""
set.guicursor = { "n-v-c:block-blinkon500", "i:block-blinkon500" }

set.backup = false
set.swapfile = false
set.writebackup = false

set.fileencoding = "utf-8"
set.clipboard = "unnamedplus"
set.completeopt = "menuone,noinsert,noselect"

-- appearances config
set.number = true
set.relativenumber = true

set.splitbelow = true
set.splitright = true

set.showmode = true
set.cursorline = true

set.background = "dark"
set.termguicolors = true

set.wrap = false
set.linebreak = true
set.breakindent = true

-- indentation config
set.tabstop = 4
set.shiftwidth = 4

set.smarttab = true
set.expandtab = true

-- searching config
set.hlsearch = true
set.smartcase = true
set.ignorecase = true

-- other config
set.updatetime = 300
set.shortmess:append("sI")

vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

-- optional config
-- set.scrolloff = 8
-- set.undofile = true

-- set.cmdheight = 2
-- set.showcmd = true

-- set.timeoutlen = 500
-- set.ttimeoutlen = 10
-- set.redrawtime = 1000
