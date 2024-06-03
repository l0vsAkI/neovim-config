-- NOTE: LSP体验增强, 包括UI, 快捷操作, 浮动终端
return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  cond = false,
  config = function()
    require("lspsaga").setup({
      ui = {
        title = false,
      },
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        enable = false,
      },
    })
  end,

  keys = {

    -- LSP finder - Find the symbol's definition
    -- If there is no definition, it will instead be hidden
    -- When you use an action in finder like "open vsplit",
    -- you can use <C-t> to jump back
    { "gh", "<cmd>Lspsaga lsp_finder<CR>", desc = "LSP Finder" },

    -- Rename all occurrences of the hovered word for the entire file
    { "gr", "<cmd>Lspsaga rename<CR>", desc = "rename" },

    -- Peek definition
    -- You can edit the file containing the definition in the floating window
    -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
    -- It also supports tagstack
    -- Use <C-t> to jump back
    { "gp", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek definition" },

    -- Go to definition
    { "gd", "<cmd>Lspsaga goto_definition<CR>", desc = "Go to definition" },

    -- Peek type definition
    -- You can edit the file containing the type definition in the floating window
    -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
    -- It also supports tagstack
    -- Use <C-t> to jump back
    { "gt", "<cmd>Lspsaga peek_type_definition<CR>", desc = "Peek type definition" },

    -- Go to type definition
    -- { "gt", "<cmd>Lspsaga goto_type_definition<CR>", desc="Go to type definition" },

    -- Show line diagnostics
    -- You can pass argument ++unfocus to
    -- unfocus the show_line_diagnostics floating window
    { "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show line diagnostics" },

    -- Show buffer diagnostics
    { "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", desc = "Show buffer diagnostics" },

    -- Show workspace diagnostics
    { "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", desc = "Show workspace diagnostics" },

    -- Show cursor diagnostics
    { "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", desc = "Show cursor diagnostics" },

    -- Diagnostic jump
    -- You can use <C-o> to jump back to your previous location
    { "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Diagnostic jump previous" },
    { "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Diagnostic jump next" },

    -- Toggle outline
    { "<leader>o", "<cmd>Lspsaga outline<CR>", desc = "Toggle outline" },

    -- Hover Doc
    -- If there is no hover doc,
    -- there will be a notification stating that
    -- there is no information available.
    -- To disable it just use ":Lspsaga hover_doc ++quiet"
    -- Pressing the key twice will enter the hover window
    { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover Doc" },

    -- If you want to keep the hover window in the top right hand corner,
    -- you can pass the ++keep argument
    -- Note that if you use hover with ++keep, pressing this key again will
    -- close the hover window. If you want to jump to the hover window
    -- you should use the wincmd command "<C-w>w"
    -- keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

    -- Call hierarchy
    { "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>", desc = "Incoming calls" },
    { "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>", desc = "Outgoing calls" },
  },
}
