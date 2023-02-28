vim.opt.termguicolors = true

require("bufferline").setup {
  options = {
    diagnostics = "coc",
    offsets = {
      {
        filetype = "NvimTree",
        text = "🫦🤺👅👉👌🈲❌⭕❣️💕💞💓",
        highlight = "Directory",
        separator = false
      }
    },
    show_buffer_close_icons = false,
    separator_style = { '👁️', '💤'}
  },
}
