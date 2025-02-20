return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      marks = true,     -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true,
        suggestions = 20,
      },
    },
    win = {
      border = "rounded",      -- none, single, double, shadow
      position = "bottom",     -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3,                    -- spacing between columns
      align = "left",                 -- align columns left, center or right
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    defaults = {
      mode = { "n", "v" },
      prefix = "<leader>",
      buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true,  -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = false, -- use `nowait` when creating keymaps
    },
    groups = {
      mode = "n",
      ["<leader>f"] = { name = "File" },
      ["<leader>ff"] = { name = "Find File" },
      ["<leader>fg"] = { name = "Find in Git" },
      ["<leader>b"] = { name = "Buffer" },
      ["<leader>c"] = { name = "Code" },
      ["<leader>d"] = { name = "Debug" },
      ["<leader>g"] = { name = "Git" },
      ["<leader>h"] = { name = "Help" },
      ["<leader>s"] = { name = "Search" },
      ["<leader>t"] = { name = "Test" },
      ["<leader>w"] = { name = "Window" },
      ["<leader>x"] = { name = "Diagnostics/Quickfix" },
      ["<leader>l"] = { name = "LSP" },
      ["<leader>u"] = { name = "UI/Toggle" },
    },
  },
  keys = {
    { "<leader>?", function() require("which-key").show("", {mode = "n", auto = true}) end, desc = "Show All Keymaps" },
    { "<leader>!", function() require("which-key").show("", {mode = "v", auto = true}) end, mode = "v", desc = "Show All Keymaps (Visual)" },
  },
}
