local servers_path = 'plugins.global.lsp.servers'
local servers_dir = vim.fn.stdpath('config') .. '/lua/plugins/global/lsp/servers'

local function load_lsp(server)
    local ok, server_module = pcall(require, servers_path .. '.' .. server)
    if ok then
        if server_module.setup then
            server_module.setup()
        end
    else
        vim.notify("Error saat memuat lsp: " .. server, vim.log.levels.ERROR)
    end
end

local function load_servers(directory)
    local handle = vim.loop.fs_scandir(directory)

    if handle then
        while true do
            local file = vim.loop.fs_scandir_next(handle)

            if not file then
                break
            end

            if file:match('%.lua') then
                local server =  file:gsub('%.lua', '')
                load_lsp(server)
            end
        end
    else
        vim.notify("Error membaca file lua dari direktori: " .. directory, vim.log.levels.ERROR)
    end
end

load_servers(servers_dir)