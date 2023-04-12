-- NOTE: telescope
return {
	"nvim-telescope/telescope.nvim",
	requires = { { "nvim-lua/plenary.nvim" } },
	config = function()
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		-- 安装ripgrep
		-- $ choco install ripgrep
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
	end,
}
