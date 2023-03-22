if vim.g.vscode then
  -- VSCode extension
  require("plugins.plugins-setup")
  require("plugins.nvim-ufo")
else
  -- ordinary Neovim
  require("core.options")
  require("plugins.plugins-setup")
  require("core.keymaps")
  -- 插件
  require("plugins.lualine")
  require("plugins.nvim-tree")
  require("plugins.treesitter")
  require("plugins.mason")
  require("plugins.cmp")
  require("plugins.null-ls")
  -- require("plugins.prettier")
  
  -- WARNING: coc.vim与mason,cmp冲突, 择一启用
  -- require("plugins.coc") 
  require("plugins.comment")
  require("plugins.bufferline")
  require("plugins.gitsigns")
  require("plugins.telescope")
  require("plugins.intent-blankline")
  require("plugins.nvim-ufo")
  require("plugins.startup")
  require("plugins.toggleterm")
  require("plugins.legendary")
  require("plugins.dressing")
  require("plugins.wilder")
  require("plugins.im-select")
end
