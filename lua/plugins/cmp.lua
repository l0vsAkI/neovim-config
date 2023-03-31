return {
  {"windwp/nvim-autopairs",
    config = function ()
      require("nvim-autopairs").setup()
    end
  }, -- 更智能的代码块边界匹配
	"onsails/lspkind-nvim", -- 智能补全美化
	{
		"hrsh7th/cmp-nvim-lsp", -- 代码自动补全
		config = function()
			local cmp = require("cmp")

			-- 配置括号自动补全
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<Tab>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})

			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "cmp_git" },
				}, {
					{ name = "buffer" },
				}),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})

			-- 弹窗美化
			local lspkind = require("lspkind")
			cmp.setup({
				formatting = {
					fields = { "kind", "abbr" },
					format = function(entry, vim_item)
						local kind = lspkind.cmp_format({ mode = "symbol", maxwidth = 80 })(entry, vim_item)
						return kind
					end,
				},
			})

			-- 修复主题造成的菜单展示奇怪现象
			for _, kind in ipairs({
				"Interface",
				"Color",
				"TypeParameter",
				"Text",
				"Enum",
				"Keyword",
				"Constant",
				"Constructor",
				"Reference",
				"Function",
				"Struct",
				"Class",
				"Module",
				"Operator",
				"Field",
				"Property",
				"Event",
				"Unit",
				"Snippet",
				"Folder",
				"Variable",
				"File",
				"Method",
				"Value",
				"EnumMember",
			}) do
				local group = string.format("CmpItemKind%s", kind)
				local bg = vim.api.nvim_get_hl_by_name(group, true)["background"]
				bg = bg and string.format("#%06X", bg) or "NONE"

				vim.api.nvim_set_hl(0, group, { fg = bg })
			end

			-- Set up lspconfig.
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- HACK: 需要接管的lsp服务名[ps:不是包名]放在这个table里
			local lspServers = { "lua_ls", "tsserver", "cssls" }

			for key, val in pairs(lspServers) do
				require("lspconfig")[val].setup({
					capabilities = capabilities,
				})
			end
		end,
	},
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
}
