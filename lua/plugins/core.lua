return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cyberdream", -- 加载默认主题
    },
  },

  -- Coding
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {} -- supertab keymap overwrite
    end,
  },
  {
    "hrsh7th/nvim-cmp",
  },

  -- Editor UI
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = { char = "" },
    },
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
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_)
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

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
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
