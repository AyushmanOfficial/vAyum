-- LSP and Lint Setup
local servers = {
	clangd = {},
	gopls = {},
	pyright = {},
	rust_analyzer = {},
	ts_ls = {},
	html = { filetypes = { "html", "twig", "hbs" } },
	cssls = {},
	tailwindcss = {},
	svelte = {},
	emmet_ls = {},
	jsonls = {},
	yamlls = {},
	lua_ls = {
		settings = {
			Lua = {
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
			},
		},
	},
}

-- Mason: LSP/DAP formatter installer
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = vim.tbl_keys(servers),
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				on_attach = function(_, bufnr)
					local nmap = function(keys, func, desc)
						if desc then
							desc = "LSP: " .. desc
						end
						vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
					end

					nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
					nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
					nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
					nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					nmap("K", vim.lsp.buf.hover, "Hover Documentation")
					nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

					vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
						vim.lsp.buf.format()
					end, { desc = "Format current buffer with LSP" })
				end,
				settings = servers[server_name],
			})
		end,
	},
})

-- Optional: LuaDev (nvim config support)
require("neodev").setup()

-- Optional: Fancy LSP status
require("fidget").setup()
