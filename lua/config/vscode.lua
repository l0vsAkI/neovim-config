-- options
local opt = vim.opt

opt.scrolloff = 4

-- kepmap
vim.cmd([[

  let mapleader = "\<Space>"
  nnoremap <silent> za <Cmd>call VSCodeNotify('editor.toggleFold')<CR>
  nnoremap <silent> zR <Cmd>call VSCodeNotify('editor.unfoldAll')<CR>
  nnoremap <silent> zM <Cmd>call VSCodeNotify('editor.foldAll')<CR>
  nnoremap <silent> zo <Cmd>call VSCodeNotify('editor.unfold')<CR>
  nnoremap <silent> zO <Cmd>call VSCodeNotify('editor.unfoldRecursively')<CR>
  nnoremap <silent> zc <Cmd>call VSCodeNotify('editor.fold')<CR>
  nnoremap <silent> zC <Cmd>call VSCodeNotify('editor.foldRecursively')<CR>

  nnoremap <silent> z1 <Cmd>call VSCodeNotify('editor.foldLevel1')<CR>
  nnoremap <silent> z2 <Cmd>call VSCodeNotify('editor.foldLevel2')<CR>
  nnoremap <silent> z3 <Cmd>call VSCodeNotify('editor.foldLevel3')<CR>
  nnoremap <silent> z4 <Cmd>call VSCodeNotify('editor.foldLevel4')<CR>
  nnoremap <silent> z5 <Cmd>call VSCodeNotify('editor.foldLevel5')<CR>
  nnoremap <silent> z6 <Cmd>call VSCodeNotify('editor.foldLevel6')<CR>
  nnoremap <silent> z7 <Cmd>call VSCodeNotify('editor.foldLevel7')<CR>

  xnoremap <silent> zV <Cmd>call VSCodeNotify('editor.foldAllExcept')<CR>

  nnoremap <Leader>e <Cmd>call VSCodeNotify('workbench.view.explorer')<CR>
  nnoremap <Leader>ff <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
  nnoremap <Leader>/ <Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>

  nmap j gj
  nmap k gk
]])

-- plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  { "LazyVim/LazyVim", import = "lazyvim.plugins.extras.vscode" },
})
