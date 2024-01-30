-- NOTE: 主题
return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "Shatur/neovim-ayu",
    config = function()
      local tmp = {}
      if vim.o.background == "dark" then
        tmp.NormalNC = { bg = "#0f151e", fg = "#808080" }
      else
        tmp.NormalNC = { bg = "#f0f0f0", fg = "#808080" }
      end
      require("ayu").setup({
        overrides = {
          Normal = { bg = "None" },
          ColorColumn = { bg = "None" },
          SignColumn = { bg = "None" },
          Folded = { bg = "None" },
          FoldColumn = { bg = "None" },
          CursorLine = { bg = "None" },
          CursorColumn = { bg = "None" },
          WhichKeyFloat = { bg = "None" },
          VertSplit = { bg = "None" },
        },
      })
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        -- Recommended - see "Configuring" below for more config options
        transparent = true,
        italic_comments = true,
        hide_fillchars = true,
        borderless_telescope = false,
      })
    end,
  },
  {
    "B4mbus/oxocarbon-lua.nvim",
    config = function()
      vim.g.oxocarbon_lua_transparent = true
      vim.g.oxocarbon_lua_alternative_telescope = true
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
    opts = {
      transparent_bg = true,
    },
  },
  "nyoom-engineering/oxocarbon.nvim",
  "olivercederborg/poimandres.nvim",
  "Mofiqul/adwaita.nvim",
  "rebelot/kanagawa.nvim",
  "frenzyexists/aquarium-vim",
  "marko-cerovac/material.nvim",
}
