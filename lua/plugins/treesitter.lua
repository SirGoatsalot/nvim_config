return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = 'master',
		lazy = false,
		build = ":TSUpdate",
		event = "BufReadPre",
		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = { 'c', 'lua', 'vim', 'markdown', 'rust', 'pico8' },
				highlight = {
					enable = true
				}
			})
		end,
	}
}
