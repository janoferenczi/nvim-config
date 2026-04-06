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

local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("gopls", {
	capabilities = capabilities,
})


vim.lsp.enable("gopls")
