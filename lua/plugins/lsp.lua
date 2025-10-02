return {
	{ 'neovim/nvim-lspconfig' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-path' },
	{
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup({
				ui = {
					border = "single",
					size = {
						width = 1,
						height = 1,
					},
				},
			})
		end

	},
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require('mason-lspconfig').setup({
				-- Replace the language servers listed here
				-- with the ones you want to install
				ensure_installed = {  },
				handlers = {
					function(server_name)
						require('lspconfig')[server_name].setup({})
					end,
				}
			})
		end

	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_bt_ft = {
				javascript = { "prettier"},
			}
		}
	},
}
