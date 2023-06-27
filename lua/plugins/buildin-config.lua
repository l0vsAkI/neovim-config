return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "ayu", -- 加载默认主题
    },
  },
  {
    "dstein64/vim-startuptime",
    enabled = false,
  },
  { "echasnovski/mini.surround", enabled = false },
  {
    "folke/noice.nvim",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "float",
      },
    },
  },
  {
    "SmiteshP/nvim-navic",
    enabled = false,
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Close right buffers" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Close left buffers" },
    },
    opts = {
      options = {
        buffer_close_icon = " ",
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(plugin)
      local icons = require("lazyvim.config").icons

      local function fg(name)
        return function()
          ---@type {foreground?:number}?
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
        end
      end

      return {
        options = {
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
          },
          lualine_x = {
            { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            },
          },
          lualine_y = {
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 1 } },
          },
          lualine_z = {
            function()
              return " " .. os.date("%R")
            end,
          },
        },
        extensions = { "neo-tree" },
      }
    end,
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
      local cmp = require("cmp")
      opts.mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
      })

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
