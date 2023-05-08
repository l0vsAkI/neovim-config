return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "ayu", -- 加载默认主题
    },
  },
  { "echasnovski/mini.surround", enabled = false },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "float",
      },
    },
  },
  { "akinsho/bufferline.nvim", opts = {
    options = {
      buffer_close_icon = " ",
    },
  } },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Live Grep",
      },
    },
  },
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
  "onsails/lspkind-nvim", -- 智能补全美化
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      -- 补全菜单美化
      local lspkind = require("lspkind")
      opts.formatting = {
        fields = { "kind", "abbr" },
        format = function(entry, vim_item)
          local kind = lspkind.cmp_format({ mode = "symbol", maxwidth = 80 })(entry, vim_item)
          return kind
        end,
      }
    end,
  },
}
