-- NOTE: 主题
return {
  {
    "folke/tokyonight.nvim",
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
    lazy = true
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
    lazy = true,
    config = function()
      vim.g.oxocarbon_lua_transparent = true
      vim.g.oxocarbon_lua_alternative_telescope = true
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = true,
    opts = {
      transparent = true,
    },
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = true
  },
  {
    "olivercederborg/poimandres.nvim",
    lazy = true
  },
  {
    "Mofiqul/adwaita.nvim",
    lazy = true
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true
  },
  {
    "frenzyexists/aquarium-vim",
    lazy = true
  },
  {
    "marko-cerovac/material.nvim",
    lazy = true
  },
}
