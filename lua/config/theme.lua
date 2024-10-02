vim.wo.relativenumber = true
vim.wo.number = true

vim.cmd[[colorscheme tokyonight-storm]]

require('nvim-web-devicons').setup({})
require('lualine').setup({
    theme = 'material'
})
