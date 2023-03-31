return { -- 编辑器快速跳转
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	}
