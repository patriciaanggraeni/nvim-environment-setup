local Plugins = {}

function Plugins.install_web_plugins()
    return {
        { 'windwp/nvim-ts-autotag' },
    }
end

function Plugins.setup_web_plugins()
    return {
        { require('plugins.web.config.autotag') },
    }
end

return Plugins
