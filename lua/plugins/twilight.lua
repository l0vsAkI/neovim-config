-- NOTE: 基于treesitter的非当前代码块失焦插件
return {
	"folke/twilight.nvim",
	config = function()
		require("twilight").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		})
	end,
}
