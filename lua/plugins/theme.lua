-- NOTE: 主题
return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = true,
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
    enabled = false,
    lazy = true,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      transparent = true,
      borderless_telescope = false,
    },
  },
  {
    "B4mbus/oxocarbon-lua.nvim",
    enabled = false,
    lazy = true,
    config = function()
      vim.g.oxocarbon_lua_transparent = true
      vim.g.oxocarbon_lua_alternative_telescope = true
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
    enabled = false,
    lazy = true,
    opts = {
      transparent = true,
    },
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    enabled = false,
    lazy = true
  },
  {
    "olivercederborg/poimandres.nvim",
    enabled = false,
    lazy = true
  },
  {
    "Mofiqul/adwaita.nvim",
    enabled = false,
    lazy = true
  },
  {
    "rebelot/kanagawa.nvim",
    enabled = false,
    lazy = true
  },
  {
    "frenzyexists/aquarium-vim",
    enabled = false,
    lazy = true
  },
  {
    "marko-cerovac/material.nvim",
    enabled = false,
    lazy = true
  },
}
