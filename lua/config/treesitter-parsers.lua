-- Setup custom parsers for treesitter

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

-- Pico-8
parser_config.pico8 = {
	install_info = {
    	url = "https://github.com/paradoxskin/tree-sitter-pico8.git",
		files = {"src/parser.c"},
  	},
  	filetype = "pico8"
}

vim.filetype.add({
	pattern = {
		['*.p8'] = 'pico8'
	}
})
vim.treesitter.language.register('pico8', 'pico8')
