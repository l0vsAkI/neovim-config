-- NOTE: 编辑器快速跳转
return {
	"ggandor/leap.nvim",
	config = function()
		require("leap").add_default_mappings()
	end,
}
