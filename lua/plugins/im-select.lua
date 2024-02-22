-- NOTE: Windows上有2个系统设置需要配置
-- 1. 配置中文和英文两个语言包: 中文(简体) | 英语(美国)
-- 2. 在高级键盘设置中, 勾选 允许我未每个应用窗口使用不同的输入法
return {
  {
    "keaising/im-select.nvim",
    opts = {
      -- IM will be set to `default_im_select` in `normal` mode
      -- For Windows/WSL, default: "1033", aka: English US Keyboard
      -- For macOS, default: "com.apple.keylayout.ABC", aka: US
      -- For Linux, default:
      --               "keyboard-us" for Fcitx5
      --               "1" for Fcitx
      --               "xkb:us::eng" for ibus
      -- You can use `im-select` or `fcitx5-remote -n` to get the IM's name
      default_im_select = "1033",

      -- Can be binary's name or binary's full path,
      -- e.g. 'im-select' or '/usr/local/bin/im-select'
      -- For Windows/WSL, default: "im-select.exe"
      -- For macOS, default: "im-select"
      -- For Linux, default: "fcitx5-remote" or "fcitx-remote" or "ibus"
      default_command = "C:\\im-select\\im-select.exe",

      -- Restore the default input method state when the following events are triggered
      set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },

      -- Restore the previous used input method state when the following events
      -- are triggered, if you don't want to restore previous used im in Insert mode,
      -- e.g. deprecated `disable_auto_restore = 1`, just let it empty
      -- as `set_previous_events = {}`
      set_previous_events = {},

      -- Show notification about how to install executable binary when binary missed
      keep_quiet_on_no_binary = false,

      -- Async run `default_command` to switch IM or not
      async_switch_im = true,
    },
  },
}
