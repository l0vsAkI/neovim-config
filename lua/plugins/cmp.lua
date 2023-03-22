-- NOTE: buffer底部配置lsp接管设置

local cmp = require 'cmp'

-- 配置括号自动补全
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})


-- 弹窗美化
local lspkind = require('lspkind')
local cmp_kinds = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}
cmp.setup {
  formatting = {
    fields = { "kind", "abbr" },
    format = function(entry, vim_item)
      -- vim_item.kind = cmp_kinds[vim_item.kind] or ""
      -- return vim_item
      local kind = lspkind.cmp_format({ mode = "symbol", maxwidth = 80 })(entry, vim_item)
      return kind
    end,
  },
}

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
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

-- HACK: 需要接管的lsp服务名[ps:不是包名]放在这个table里
  local lspServers = { 'lua_ls', 'tsserver', 'html','jsonls','cssls','marksman','vuels' }

for key, val in pairs(lspServers) do
  require('lspconfig')[val].setup {
    capabilities = capabilities
  }
end
