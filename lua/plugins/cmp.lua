return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"petertriho/cmp-git"
		},
  		config = function()
  		  	local cmp = require("cmp")
  		  	cmp.setup({
				snippet = {
    				-- REQUIRED - you must specify a snippet engine
    			    expand = function(args)
    			      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    			      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    			      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    			      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    			      -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

    			      -- For `mini.snippets` users:
    			      -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
    			      -- insert({ body = args.body }) -- Insert at cursor
    			      -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
    			      -- require("cmp.config").set_onetime({ sources = {} })
    			    end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
  		  		mapping = cmp.mapping.preset.insert({

  		  	  		-- Navigate between completion items
  		  	  		['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
  		  	  		['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),

  		  	  		-- `Enter` key to confirm completion
  		  	  	 	['<CR>'] = cmp.mapping.confirm({select = false}),

  					-- Ctrl+Space to trigger completion menu
  		  	  		['<C-Space>'] = cmp.mapping.complete(),

  		  	  		-- Scroll up and down in the completion documentation
  		  	  		['<C-u>'] = cmp.mapping.scroll_docs(-4),
  		  	  		['<C-d>'] = cmp.mapping.scroll_docs(4),
  		  	  	}),

  		  	  	snippet = {
  		  	  		expand = function(args)
  		  	  			vim.snippet.expand(args.body)
  		  	  		end,
  		  	  	},
				sources = cmp.config.sources(
					{
						{ name = 'nvim_lsp' },
						{ name = 'vsnip' },
					}, 
					{
						{ name = 'buffer' },
					}
				)
  		  	})

			-- Setup git stuff 
			cmp.setup.filetype('gitcommit', {
				sources = cmp.config.sources(
					{
						{ name = 'git' }
					},
					{
						{ name = 'buffer' }
					}
				)
			}) 
			require("cmp_git").setup()

			cmp.setup.cmdline( {'/', '?'}, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})

			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources(
					{
						name = 'path'
					},
					{
						name = 'cmdline'
					}
				),
			})
  		end,
	}
}
