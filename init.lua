if vim.g.vscode then
-- VSCode extension
else
	-- ordinary Neovim
	require("config.options")
	require("config.keymaps")
	require("config.lazy")
end
