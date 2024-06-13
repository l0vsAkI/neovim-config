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
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      borderless_telescope = false,
    },
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
