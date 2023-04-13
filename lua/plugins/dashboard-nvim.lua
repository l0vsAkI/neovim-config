-- NOTE: 欢迎界面

return {
	"glepnir/dashboard-nvim",
	event = "VimEnter",
	cond = true,
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {

				week_header = {
					enable = true,
				},
				shortcut = {
					{
						icon = " ",
						desc = "Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						icon = " ",
						desc = "Recently",
						group = "Title",
						action = "Telescope oldfiles",
						key = "r",
					},
					{
						icon = " ",
						desc = "Update",
						group = "@property",
						action = "Lazy update",
						key = "u",
					},
				},
				project = { enable = false },
				mru = { limit = 1 },
			},
		})

		vim.cmd([[
      autocmd FileType Dashboard hi link DashboardHeader Label
      autocmd FileType Dashboard hi link DashboardCenter Identifier
      autocmd FileType Dashboard hi link DashboardShortCut String
      autocmd FileType Dashboard hi link DashboardFooter Comment
    ]])
	end,
}
