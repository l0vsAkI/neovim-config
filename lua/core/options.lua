-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口向右和向下分割
opt.splitright = true
opt.splitbelow = true

-- 搜索不区分大小写
--opt.ignorecase = true
--opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"
-- opt.pumblend= 15 -- 弹出菜单透明度

vim.opt.background = "dark" -- set this to dark or light
vim.cmd.colorscheme "oxocarbon"
