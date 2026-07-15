-- Editor and stuff
vim.cmd [[set tabstop=4]]
vim.cmd [[set shiftwidth=4]]
vim.cmd [[tnoremap <Esc> <C-\><C-n>]]
vim.cmd [[colorscheme tokyonight]]
-- UI and stuff
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.listchars = {
	space = ".",
	tab = ">> ",
}

vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = 'grey', bold = false })
vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white', bold = true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = 'grey', bold = false })

local telescope = require('telescope')
telescope.setup {
	defaults = {
		path_display = { "filename_first" }
	}
}
telescope.load_extension('fzf')

require('nvim-web-devicons').setup {}
require('mason').setup {}
require('lualine').setup {}
require('trouble').setup {}
require('tag-wrapper').setup {}

-- Tree-sitter
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})
