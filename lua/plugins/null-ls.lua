-- NOTE: null-ls提供DAP与formatter服务
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
return {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			-- HACK: 在Mason中安装的source需要在此配置
			sources = { null_ls.builtins.formatting.prettier, null_ls.builtins.formatting.stylua },
			on_attach = function(client, bufnr)
				-- 代码格式化
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								bufnr = bufnr,
								filter = function(client)
									return client.name == "null-ls"
								end,
							})
						end,
					})
				end
			end,
		})
	end,
}
