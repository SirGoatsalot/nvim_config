return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			handlers = {
    		    function(server_name)
    		        require("lspconfig")[server_name].setup {}
			    end
 			},
		}
	},

	{ "mason-org/mason.nvim", opts = {} }
}
