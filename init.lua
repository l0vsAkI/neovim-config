if vim.g.vscode then
	-- VSCode extension
	require("config.keymaps")
	require("config.options")
	require("config.lazy")
else
	-- ordinary Neovim
	require("config.options")
	require("config.keymaps")
	require("config.lazy")
end
