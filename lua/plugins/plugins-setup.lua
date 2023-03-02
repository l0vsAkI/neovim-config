local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 保存此文件自动更新安装软件
-- 注意PackerCompile改成了PackerSync
-- plugins.lua改成了plugins-setup.lua，适应本地文件名字
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- 插件列表
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use({ -- 主题
    'projekt0n/github-nvim-theme', tag = 'v0.0.7',
  -- or                            branch = '0.0.x'
    config = function()
      require('github-theme').setup({
        theme_style = "dark_default",
      })
    end
  })

  use { -- 状态栏
    'nvim-lualine/lualine.nvim', 
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use 'nvim-tree/nvim-web-devicons' -- 图标库

  use { -- 文档树
   'nvim-tree/nvim-tree.lua',
  }

  use("christoomey/vim-tmux-navigator") -- 窗口导航

  use "nvim-treesitter/nvim-treesitter" -- 语法高亮

  use "p00f/nvim-ts-rainbow" -- 括号颜色区分

  use "numToStr/Comment.nvim" -- gcc和gc注释

  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'} -- buffer栏

  use "lewis6991/gitsigns.nvim" -- 左则git提示

  use { -- telescope
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use "lukas-reineke/indent-blankline.nvim" -- 缩进指引

  -- 终端管理器
  use {"akinsho/toggleterm.nvim" }

  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'} -- 代码折叠

  -- 欢迎页
  use "startup-nvim/startup.nvim"

  -- coc
  use {'neoclide/coc.nvim', branch = 'release'}

  use({ --命令可视化
    'mrjones2014/legendary.nvim',
    -- sqlite is only needed if you want to use frecency sorting
    -- requires = 'kkharji/sqlite.lua'
  })

  use {'stevearc/dressing.nvim'} -- Command UI 美化

  use({ -- 编辑器快速跳转
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end
  })


  use { -- TODO list
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use({ --环绕编辑
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
  })

  use 'gelguy/wilder.nvim' -- 命令补全

  use { -- error审查
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end
  }

  use { -- 淡化未使用的Symbol
    "zbirenbaum/neodim",
    event = "LspAttach",
    config = function ()
      require("neodim").setup({
        alpha = 0.75,
        blend_color = "#000000",
        update_in_insert = {
          enable = true,
          delay = 100,
        },
        hide = {
          virtual_text = true,
          signs = true,
          underline = true,
        }
      })
    end
  }

  use 'keaising/im-select.nvim' -- 输入法自动切换

  if packer_bootstrap then
    require('packer').sync()
  end
end)
