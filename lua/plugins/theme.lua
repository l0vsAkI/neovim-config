return {
  {
    "glepnir/zephyr-nvim",
  },
  { "Everblush/nvim", name = "everblush" },
  {
    "olivercederborg/poimandres.nvim",
    config = function()
      -- HACK: 在这里修改启动默认主题
      vim.cmd([[colorscheme everblush]])
    end,
  },
}
