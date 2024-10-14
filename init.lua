-- memuat plugins
local status_plugins, error_plugins = pcall(require, 'core.plugins')
if not status_plugins then
    print('Error loading plugins: ' .. error_plugins)
end

-- memuat settings
local status_settings, error_settings = pcall(require, 'core.settings')
if not status_settings then
    print('Error loading settings: ' .. error_settings)
end

-- memuat keymaps
local status_keymaps, error_keymaps = pcall(require, 'core.keymaps')
if not status_keymaps then
    print('Error loading keymaps: ' .. error_keymaps)
end

-- memuat themes
local status_themes, error_themes = pcall(require, 'core.themes')
if status_themes then
    require('core.themes').load_theme()
else
    print('Error loading themes: ' .. error_themes)
end
