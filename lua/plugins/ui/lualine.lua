return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local function lsp()
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			if #clients == 0 then
				return ""
			end

			local names = {}
			for _, client in ipairs(clients) do
				table.insert(names, client.name)
			end
			return "  " .. table.concat(names, ", ")
		end

		require("lualine").setup({
			options = {
				theme = "auto",
				globalstatus = true,
				icons_enabled = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard", "neo-tree", "NvimTree" },
			},

			sections = {
				lualine_a = { { "mode", icon = "" } },

				lualine_b = {
					{ "branch", icon = "" },
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
					},
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
				},

				lualine_c = {
					{
						"filename",
						path = 1, -- relative path
						symbols = {
							modified = "●",
							readonly = "",
							unnamed = "[No Name]",
						},
					},
				},

				lualine_x = {
					lsp,
					"encoding",
					{ "filetype", colored = false },
					{ "datetime", style = "%a %I:%M %p" },
				},

				lualine_y = { "progress" },
				lualine_z = { "location" },
			},

			extensions = {
				"lazy",
				"nvim-tree",
				"neo-tree",
				"toggleterm",
				"quickfix",
				"fugitive",
				"trouble",
			},
		})
	end,
}
