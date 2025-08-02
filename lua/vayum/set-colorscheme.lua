local M = {}

local theme_file = vim.fn.stdpath("config") .. "/.last_colorscheme"
local default_theme = "base16-tokyodark"

local function apply(theme, opts)
	opts = opts or {}
	local ok, _ = pcall(vim.cmd.colorscheme, theme)
	if ok then
		if opts.save then
			vim.fn.writefile({ theme }, theme_file)
		end
		if opts.notify then
			vim.notify("Theme set to: " .. theme, vim.log.levels.INFO, { title = "vAyum Theme" })
		end
	elseif opts.notify then
		vim.notify("Theme not found: " .. theme, vim.log.levels.ERROR, { title = "vAyum Theme" })
	end
end

function M.load()
	local theme = default_theme
	if vim.fn.filereadable(theme_file) == 1 then
		local lines = vim.fn.readfile(theme_file)
		if #lines > 0 then
			theme = lines[1]
		end
	end
	apply(theme)
end

function M.pick()
	require("telescope.builtin").colorscheme({
		enable_preview = true,
		attach_mappings = function(_, map)
			map("i", "<CR>", function(prompt_bufnr)
				local entry = require("telescope.actions.state").get_selected_entry()
				require("telescope.actions").close(prompt_bufnr)
				apply(entry.value, { save = true, notify = true })
			end)
			return true
		end,
	})
end

return M
