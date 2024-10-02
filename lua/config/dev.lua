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
