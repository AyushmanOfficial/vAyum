local M = {}

local themes = {
	"base16-tokyodark",
	"base16-gruvbox-dark-hard",
	"base16-onedark",
	"base16-nord",
	"base16-snazzy",
	-- You can add any theme you like (you can preview them using <leader>ct) :)
}

local theme_file = vim.fn.stdpath("config") .. "/.last_colorscheme"

local function read_last()
	if vim.fn.filereadable(theme_file) == 1 then
		local lines = vim.fn.readfile(theme_file)
		if #lines > 0 then
			return lines[1]
		end
	end
	return themes[1]
end

function M.cycle()
	local current = read_last()
	local next_index = 1

	for i, theme in ipairs(themes) do
		if theme == current then
			next_index = (i % #themes) + 1
			break
		end
	end

	local next_theme = themes[next_index]
	local ok, _ = pcall(vim.cmd.colorscheme, next_theme)
	if ok then
		vim.fn.writefile({ next_theme }, theme_file)
		vim.notify("Cycled to: " .. next_theme, vim.log.levels.INFO, { title = "vAyum Theme" })
	else
		vim.notify("Theme not found: " .. next_theme, vim.log.levels.ERROR, { title = "vAyum Theme" })
	end
end

return M
