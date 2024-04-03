return {
  "onsails/lspkind-nvim", -- 智能补全菜单美化
  config = function()
    -- 补全菜单美化
    local lspkind = require("lspkind")
    local cmp = require("cmp")
    cmp.setup({
      formatting = {
        expandable_indicator = true,
        fields = { "kind", "abbr" },
        format = function(entry, vim_item)
          return lspkind.cmp_format({ mode = "symbol", preset = "codicons", maxwidth = 80, show_labelDetails = true })(
            entry,
            vim_item
          )
        end,
      },
    })
  end,
}
