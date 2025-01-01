-- Editor and stuff
vim.cmd[[set tabstop=4]]
vim.cmd[[set shiftwidth=4]]

-- UI and stuff
vim.wo.relativenumber = true
vim.wo.number = true

vim.cmd[[colorscheme catppuccin-mocha]]
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='grey', bold=true })
vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='darkgrey', bold=true })

require('lsp-config')


vim.keymap.set('n', '<Leader>l', '<cmd>lua vim.lsp.buf.format()<CR>', {} )
