
-- Editor and stuff
vim.cmd[[set tabstop=4]]
vim.cmd[[set shiftwidth=4]]

-- Tools
require('neogit').setup({})
require('neorg').setup({
	load = {
		["core.defaults"] = {},
		["core.concealer"] = {},
		["core.keybinds"] = {},
		["core.dirman"] = {
			config = {
				workspaces = {
					notes = "~/develop/neorg",
				},
				default_workspace = "notes"
			},
		},
	},
})

-- Basic keybindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>ng', '<cmd>Neogit<cr>', { desc = 'Neogit open' })
vim.keymap.set('n', '<leader>nt', '<cmd>Neotree toggle<cr>', { desc = 'Neotree toggle' })

-- UI and stuff
vim.wo.relativenumber = true
vim.wo.number = true

vim.cmd[[colorscheme tokyonight-storm]]

require('nvim-web-devicons').setup({})
require('lualine').setup({
    theme = 'material'
})
