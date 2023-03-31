return {
	"MunifTanjim/prettier.nvim",
	opts = {

		bin = "prettier",
		filetypes = {
			"css",
			"graphql",
			"html",
			"javascript",
			"javascriptreact",
			"json",
			"less",
			"markdown",
			"scss",
			"typescript",
			"typescriptreact",
			"vue",
			"yaml",
		},
		["null-ls"] = {
			condition = function()
				return prettier.config_exists({
					check_package_json = true,
				})
			end,
			runtime_condition = function(params)
				-- return false to skip running prettier
				return true
			end,
			timeout = 5000,
		},
	},
}
