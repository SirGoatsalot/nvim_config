return {

	-- Gruvbox Material Color Scheme
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[ colorscheme gruvbox-material ]])
		end,

	},
    
	-- Set up buffer line
	{
	  "akinsho/bufferline.nvim",
	  lazy = false,
	  keys = {
	    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
	    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
	    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
	    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
	    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
	    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
	    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
	    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
	    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
	    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
	  },
	  opts = {
	    options = {
	      -- stylua: ignore
	      close_command = function(n) Snacks.bufdelete(n) end,
	      -- stylua: ignore
	      right_mouse_command = function(n) Snacks.bufdelete(n) end,
	      diagnostics = "nvim_lsp",
	      always_show_bufferline = true,
	    },
	  },
	},

	-- Set up status line
	{
    	'nvim-lualine/lualine.nvim',
    	dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				icons_enabled = true,
		    	theme = 'auto',
		    	component_separators = { left = '', right = ''},
		    	section_separators = { left = '', right = ''},
		    	disabled_filetypes = {
		    	  statusline = {},
		    	  winbar = {},
		    	},
		    	ignore_focus = {},
		    	always_divide_middle = true,
		    	always_show_tabline = true,
		    	globalstatus = false,
		    	refresh = {
		    	  statusline = 1000,
		    	  tabline = 1000,
		    	  winbar = 1000,
		    	  refresh_time = 16, -- ~60fps
		    	  events = {
		    	    'WinEnter',
		    	    'BufEnter',
		    	    'BufWritePost',
		    	    'SessionLoadPost',
		    	    'FileChangedShellPost',
		    	    'VimResized',
		    	    'Filetype',
		    	    'CursorMoved',
		    	    'CursorMovedI',
		    	    'ModeChanged',
		    	  },
		    	}
			},

  			sections = {
  			  lualine_a = {'mode'},
  			  lualine_b = {'branch', 'diff', 'diagnostics'},
  			  lualine_c = {'filename'},
  			  lualine_x = {'encoding', 'fileformat', 'filetype'},
  			  lualine_y = {'progress'},
  			  lualine_z = {'location'}
  			},
  			inactive_sections = {
  			  lualine_a = {},
  			  lualine_b = {},
  			  lualine_c = {'filename'},
  			  lualine_x = {'location'},
  			  lualine_y = {},
  			  lualine_z = {}
  			},
  			tabline = {},
  			winbar = {},
  			inactive_winbar = {},
  			extensions = {}
		}
	}
}
