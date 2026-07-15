require("mason").setup()
require("mason-lspconfig").setup()

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua,go' },
  callback = function() vim.treesitter.start() end,
})

vim.treesitter.language.register("lua", { "lua" })
vim.treesitter.language.register("go", { "go" })

local cmp = require("cmp")
cmp.setup {
	completion = {
		autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
	},

	window = {
		completion = cmp.config.window.bordered({
			border = "rounded"
		}),
		documentation = cmp.config.window.bordered({
			border = "rounded"
		}),
	},

	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true}),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
	}),

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
	}),
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local buf = ev.buf

    -- Helper to set buffer-local keymaps
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
    end

    -- Navigation
    map('n', 'gd',         vim.lsp.buf.definition,      'Go to definition')
    map('n', 'gD',         vim.lsp.buf.declaration,     'Go to declaration')
    map('n', 'gi',         vim.lsp.buf.implementation,  'Go to implementation')
    map('n', 'gr',         vim.lsp.buf.references,      'Go to references')
    map('n', 'gy',         vim.lsp.buf.type_definition, 'Go to type definition')

    -- Docs / signature
    map('n', 'K',          vim.lsp.buf.hover,           'Hover documentation')
    map('n', '<C-k>',      vim.lsp.buf.signature_help,  'Signature help')

    -- Refactoring
    map('n', '<leader>rn', vim.lsp.buf.rename,          'Rename symbol')
    map('n', '<leader>ca', vim.lsp.buf.code_action,     'Code action')
    map('x', '<leader>ca', vim.lsp.buf.code_action,     'Code action (visual)')

    -- Diagnostics
    map('n', '[d',         vim.diagnostic.goto_prev,    'Previous diagnostic')
    map('n', ']d',         vim.diagnostic.goto_next,    'Next diagnostic')
    map('n', '<leader>e',  vim.diagnostic.open_float,   'Show diagnostic')
    map('n', '<leader>q',  vim.diagnostic.setloclist,   'Diagnostics to loclist')

    -- Optional: only map if the server supports the capability
    if client and client.supports_method('textDocument/formatting') then
      map('n', '<leader>lf', function()
        vim.lsp.buf.format({ async = true })
      end, 'Format buffer')
    end

    if client and client.supports_method('textDocument/inlayHint') then
      map('n', '<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }))
      end, 'Toggle inlay hints')
    end
  end,
})

vim.lsp.enable("gopls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("pyright")
