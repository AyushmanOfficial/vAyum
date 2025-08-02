return {
	"rcarriga/nvim-notify",
	lazy = false, -- load immediately
	priority = 1000, -- load before other plugins
	opts = {
		stages = "fade",
		timeout = 3000,
		render = "default",
		top_down = true,
	},
	config = function(_, opts)
		local notify = require("notify")
		notify.setup(opts)
		vim.notify = notify -- THIS must happen BEFORE Noice loads
	end,
}
