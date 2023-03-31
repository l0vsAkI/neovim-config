return {
	"nvim-tree/nvim-web-devicons", -- 图标库
	"christoomey/vim-tmux-navigator", -- 窗口导航
	{
		"numToStr/Comment.nvim",
	}, -- gcc和gc注释
	{
		"lewis6991/gitsigns.nvim",
	}, -- 左则git提示
	{
		-- 缩进指引
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			show_current_context = true,
			show_current_context_start = true,
		},
	},
}
