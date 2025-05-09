-- Editor and stuff
vim.cmd[[set tabstop=4]]
vim.cmd[[set shiftwidth=4]]
vim.cmd[[tnoremap <Esc> <C-\><C-n>]]
-- UI and stuff
vim.wo.relativenumber = true
vim.wo.number = true

vim.cmd[[colorscheme catppuccin-mocha]]
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='grey', bold=true })
vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='darkgrey', bold=true })

require('lsp-config')

local cmp = require("cmp")
cmp.setup({
    sources = cmp.config.sources({
        { name = "path" },  -- Enables path completion
        { name = "nvim_lsp" },  -- LSP completion
        { name = "buffer" },  -- Buffer word completion
    }),
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),  -- Trigger completion manually
        ["<CR>"] = cmp.mapping.confirm({ select = true }),  -- Confirm selection
    }),
})

vim.keymap.set('n', '<Leader>l', '<cmd>lua vim.lsp.buf.format()<CR>', {} )
vim.keymap.set('n', '<Leader>LU', '<cmd>Lazy update<CR>', {} )
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
		header = false,
		prefix = " ▶ "
	}
})

vim.cmd([[
  highlight DiagnosticError guifg=#ff0000
  highlight DiagnosticWarn guifg=#ffcc00
  highlight DiagnosticInfo guifg=#00ff00
  highlight DiagnosticHint guifg=#0000ff
]])

vim.o.updatetime = 250  -- how long to wait before triggering CursorHold

vim.cmd([[
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

require('conform').setup({
	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 500,
	}
})
