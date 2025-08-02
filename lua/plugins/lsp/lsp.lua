vim.diagnostic.config({
	signs = false, -- this is the gutter symbols
	virtual_text = true, -- ← this is the inline thingy
	underline = true, -- underlines offending code
	update_in_insert = false,
	severity_sort = true,
})

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"j-hui/fidget.nvim",
		"folke/neodev.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("vayum.lsp") -- or whatever your file is called
	end,
}
