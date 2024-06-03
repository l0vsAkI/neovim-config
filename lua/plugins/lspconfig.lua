return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      unocss = { -- 配置unocss报错信息
        handlers = {
          ["textDocument/documentHighlight"] = function() end,
        },
      },
    },
  },
}
