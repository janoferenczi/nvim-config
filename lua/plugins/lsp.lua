return {
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{
		'williamboman/mason.nvim',
		config = function ()
			require('mason').setup({})
		end

	},
	{
		'williamboman/mason-lspconfig.nvim',
		config = function ()
			require('mason-lspconfig').setup({
				-- Replace the language servers listed here
				-- with the ones you want to install
				ensure_installed = {'angularls', 'cssls'},
				handlers = {
					function(server_name)
						require('lspconfig')[server_name].setup({})
					end,
				}
			})
		end

	},
}
