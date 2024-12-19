return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cyberdream", -- 加载默认主题
    },
  },

  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Close right buffers" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Close left buffers" },
      { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close left buffers" },
    },
    opts = {
      options = {
        buffer_close_icon = " ",
      },
    },
  },

  -- LSP
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- UI
  {
    "rcarriga/nvim-notify",
    opts = {
      -- background_colour = "#000000", -- ayu主题透明度的兼容处理
    },
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, { -- 解决多个lsp-server导致的文档提示报错
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
    end,
  },
}
