-- NOTE: 输入法自动切换
return {
  "keaising/im-select.nvim",
  opts = {
    default_im_select = "1033",
    default_command = "C:\\im-select\\im-select.exe",
    set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },
    set_previous_events = {},
  },
}
