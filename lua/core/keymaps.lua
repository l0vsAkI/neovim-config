vim.g.mapleader = " "

local keymap = vim.keymap

-- 视觉模式
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- 取消高亮
keymap.set("n", "<leader>h", ":nohl<CR>")

-- 插件
-- nvim-tree
keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")

-- 切换buffer
keymap.set("n", "<A-l>", ":bnext<CR>")
keymap.set("n", "<A-h>", ":bprevious<CR>")

-- 自定义buffer关闭行为
require("utils.closeBuffer")
keymap.set("n", "<leader>d", closeBuffer)
