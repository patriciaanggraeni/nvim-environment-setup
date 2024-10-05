local M = {}

function M.init()
    local set_keymap = function(mode, keys, command, opts)
        opts = opts or {}
        opts.noremap = opts.noremap ~= true
        opts.silent = opts.silent ~= true
        
        return vim.keymap.set(mode, keys, command, opts)
    end

    return set_keymap
end

return M