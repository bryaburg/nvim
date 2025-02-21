-- Then load other configurations
require("config.vim-options")
require("lazy").setup({
	spec = {
		{ "folke/tokyonight.nvim",  config = function() vim.cmd.colorscheme "tokyonight" end },
		{ import = "config.plugins" },
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		notify = true, -- get a notification when changes are found
	},
})
require("config.keymappings")
