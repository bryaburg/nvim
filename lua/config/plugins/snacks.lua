return {
  "folke/snacks.nvim",
  dependencies = {
    "echasnovski/mini.icons", -- we'll keep this as it's needed for icons
  },
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
                                                                     
       ████ ██████           █████      ██                     
      ███████████             █████                             
      █████████ ███████████████████ ███   ███████████   
     █████████  ███    █████████████ █████ ██████████████   
    █████████ ██████████ █████████ █████ █████ ████ █████   
  ███████████ ███    ███ █████████ █████ █████ ████ █████  
 ██████  █████████████████████ ████ █████ █████ ████ ██████ 
        ]],
      },
    },
    indent = { enabled = true },
    input = { enabled = true },
    git = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    { "<leader>sf", function() require("snacks").scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>S", function() require("snacks").scratch.select() end, desc = "Select Scratch Buffer" },
    { "<leader>gl", function() require("snacks").lazygit.log_file() end, desc = "Lazygit Log (cwd)" },
    { "<leader>lg", function() require("snacks").lazygit() end, desc = "Lazygit" },
    { "<C-p>", function() require("snacks").picker.pick("files") end, desc = "Find Files" },
    { "<leader><leader>", function() require("snacks").picker.recent() end, desc = "Recent Files" },
    { "<leader>fb", function() require("snacks").picker.buffers() end, desc = "Buffers" },
    { "<leader>fg", function() require("snacks").picker.grep() end, desc = "Grep Files" },
    { "<C-n>", function() require("snacks").explorer() end, desc = "Explorer" },
  }
}
