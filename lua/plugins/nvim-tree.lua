
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  view = {
    hide_root_folder = true,
    float = {
      enable = true,
      open_win_config = {
       relative='editor',
        border = 'rounded',
        width=100,height=100
      }
    }
  }
})
