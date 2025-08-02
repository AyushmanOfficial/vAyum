local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader (THE ALMIGHTY SPACE)
vim.g.mapleader = " "

-- Basic stuff
map("n", "<Esc>", "<cmd>noh<CR>", opts) -- clear highlights
map("n", "<C-d>", "<C-d>zz", opts) -- scroll down, center
map("n", "<C-u>", "<C-u>zz", opts) -- scroll up, center
map("n", "n", "nzzzv", opts) -- next match, center
map("n", "N", "Nzzzv", opts)

-- Telescope
local builtin = require("telescope.builtin")

map("n", "<leader>sf", function()
	builtin.find_files({
		prompt_title = " Find Files",
	})
end, { desc = "[S]earch [F]iles" })

map("n", "<leader>sg", function()
	builtin.live_grep({
		prompt_title = "󰱽 Grep Word",
	})
end, { desc = "[S]earch by [G]rep" })

map("n", "<leader>sh", function()
	builtin.help_tags({
		prompt_title = "󰘧 Help Tags",
	})
end, { desc = "[S]earch [H]elp" })

map("n", "<leader>sn", function()
	builtin.find_files({
		prompt_title = " vAyum Config",
		cwd = vim.fn.stdpath("config"),
		hidden = true,
	})
end, { desc = "[S]earch [N]eovim files" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- vAyum theme picker (ye, i made it. :D)
map("n", "<leader>ct", function()
	require("vayum.set-colorscheme").pick()
end, { desc = "[C]hoose [T]heme (vAyum)" })

-- vAyum theme cycle
vim.keymap.set("n", "<leader>st", function()
	require("vayum.cycle-colorschemes").cycle()
end, { desc = "[S]witch [T]heme (vAyum)" })

-- Bufferline
-- Move buffer (reorder)
map("n", "<A-S-,>", "<Cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })
map("n", "<A-S-.>", "<Cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })

-- Cycle buffer
map("n", "<A-,>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
map("n", "<A-.>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })

-- Delete buffer
map("n", "<A-c>", "<Cmd>bdelete<CR>", { desc = "Delete buffer" })
