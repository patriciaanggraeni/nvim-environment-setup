local tree = {
	'kyazdani42/nvim-tree.lua',
	lazy = false,
	requires = { 'kyazdani42/nvim-web-devicons', },
	config = function()
		require('nvim-tree').setup {
			disable_netrw = true,
			hijack_netrw = true,
			update_cwd = false,
			view = {
				width = 35,
				side = 'left',
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				highlight_git = true,
			},
			filters = {
				dotfiles = false,
			},
			update_focused_file = {
				enable = false,
				update_cwd = false,
			},
			git = {	
				enable = true,
				ignore = false,
				show_on_dirs = true,
			},
		}
	end,
}

return tree
