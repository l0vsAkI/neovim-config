-- NOTE: telescope粘贴历史记录扩展
return {
	"AckslD/nvim-neoclip.lua",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		-- you'll need at least one of these
		-- {'nvim-telescope/telescope.nvim'},
		-- {'ibhagwan/fzf-lua'},
	},
	config = function()
		require("neoclip").setup()
	end,
}
