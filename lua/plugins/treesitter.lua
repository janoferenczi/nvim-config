return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		local configs = require('nvim-treesitter.configs')

		configs.setup({
			ensure_installed = { 'lua', 'typescript', 'angular', 'javascript', 'norg', 'c', 'cpp', 'make', 'rust', 'java', 'groovy', 'sql', 'html', 'css', 'go', 'zig' },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
		})
	end
}
