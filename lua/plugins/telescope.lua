return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		-- Basic keybindings
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

		vim.keymap.set('n', '<leader>ng', '<cmd>Neogit<cr>', { desc = 'Neogit open' })
		vim.keymap.set('n', '<leader>nt', '<cmd>Neotree toggle<cr>', { desc = 'Neotree toggle' })

		require('telescope').setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					"build",
					"**/*.class",
					"venv/",
					"__pycache__/",
				}
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				}
			}
		})

		require('telescope').load_extension('fzf')

	end
}
