local function gh(package)
	return { src = "https://github.com/" .. package }
end

vim.pack.add { gh("folke/tokyonight.nvim") }
vim.pack.add { gh("ellisonleao/gruvbox.nvim") }
vim.pack.add { gh("nvim-lualine/lualine.nvim") }
vim.pack.add { 
	gh("nvim-telescope/telescope.nvim"),
	gh("nvim-lua/plenary.nvim"),
	gh("nvim-telescope/telescope-fzf-native.nvim"),
}
vim.pack.add { gh("folke/which-key.nvim") }
vim.pack.add { gh("neogitorg/neogit") }
vim.pack.add({
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3')
  },
  -- dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  -- optional, but recommended
  "https://github.com/nvim-tree/nvim-web-devicons",
})
vim.pack.add { gh("nvim-treesitter/nvim-treesitter") }
vim.pack.add { gh("nvim-treesitter/nvim-treesitter-textobjects") }
vim.pack.add { gh("nvim-tree/nvim-web-devicons") }
vim.pack.add {
	gh("hrsh7th/nvim-cmp"),
	gh("hrsh7th/cmp-nvim-lsp"),
	gh("hrsh7th/cmp-buffer"),
	gh("hrsh7th/cmp-path"),
}
vim.pack.add({
	gh("mason-org/mason.nvim"),
	gh("mason-org/mason-lspconfig.nvim"),
	gh("neovim/nvim-lspconfig"),
})
vim.pack.add({
	gh("folke/trouble.nvim")
})
vim.pack.add({
	gh("janoferenczi/tag-wrapper.nvim")
})
