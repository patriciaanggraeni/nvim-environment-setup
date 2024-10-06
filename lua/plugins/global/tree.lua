local M = {}


function M.setup()
	require("packer").use({
		"kyazdani42/nvim-tree.lua",
		requires = { 'kyazdani42/nvim-web-devicons', },
		config = function()
			require("nvim-tree").setup {
                disable_netrw = true,
                hijack_netrw = true,
                update_cwd = true,
				view = {
					width = 30,
					side = 'left',
				},
				renderer = {
					indent_markers = {
						enable = true,
					},
				},
				filters = {
					dotfiles = true,
				},
				update_focused_file = {
					enable = true,
					update_cwd = true,
				},
				git = {	
					enable = true,
                    ignore = false,
                    show_on_dirs = true,
				},
			}
		end,
	})
end


return M
