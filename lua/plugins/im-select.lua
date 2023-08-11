-- NOTE: 输入法自动切换
return {
  -- 出了bug, 不能用了
  -- "keaising/im-select.nvim",
  -- opts = {
  --   default_im_select = "1033",
  --   default_command = "C:\\im-select\\im-select.exe",
  --   set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },
  --   set_previous_events = {},
  -- },
  "wingforth/nvim-im-select",
  opts = {
    im_select_cmd = "C:\\im-select\\im-select.exe",
    default_im = "1033",
  },
}
