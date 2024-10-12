local set = vim.opt
local api = vim.api
local group = api.nvim_create_augroup("Setting", { clear = true })

-- general config
local general_config = {
    mouse = "",
    guicursor = { "n-v-c:block-blinkon500", "i:block-blinkon500" },
    backup = false,
    swapfile = false,
    writebackup = false,
    fileencoding = "utf-8",
    clipboard = "unnamedplus",
    completeopt = "menuone,noinsert,noselect",
}

local appearances_config = {
    number = true,
    relativenumber = true,
    splitbelow = true,
    splitright = true,
    showmode = true,
    cursorline = true,
    background = "dark",
    termguicolors = true,
    wrap = false,
    linebreak = true,
    breakindent = true,
}

local indentation_config = {
    tabstop = 4,
    shiftwidth = 4,
    smarttab = true,
    expandtab = true,
}

local search_config = {
    hlsearch = true,
    smartcase = true,
    ignorecase = true,
}

local other_config = {
    updatetime = 300,
    shortmess:append("sI"),
    timeoutlen = 500,
    ttimeoutlen = 10,
    -- scrolloff = 8,
    -- undofile = true,
    -- cmdheight = 2,
    -- showcmd = true,
    -- redrawtime = 1000,
}

for option, value in pairs(general_config) do
    set[option] = value
end

for option, value in pairs(appearances_config) do
    set[option] = value
end

for option, value in pairs(indentation_config) do
    set[option] = value
end

for option, value in pairs(search_config) do
    set[option] = value
end

for option, value in pairs(other_config) do
    set[option] = value
end

api.nvim_exec([[ 
    syntax on 
    filetype plugin indent on
]], false)

api.nvim_create_autocmd("BufWritePost", {
    group = group,
    pattern = "*",
    command = "source <afile>",
})