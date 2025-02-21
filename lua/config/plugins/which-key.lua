return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    local wk = require("which-key")
    
    wk.setup({
      delay = 0,
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          Back = '<BS> ',
          Delete = '<Del> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          Return = '<CR> ',
          Escape = '<Esc> ',
        }
      },
    })

    -- Register all keymaps
    wk.add({
      mode = { "n", "v" }, -- Set default mode to NORMAL and VISUAL
      -- Project related
      { "<leader>p", group = "[P]roject" },
      { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find File" },
      { "<leader>ps", "<cmd>Telescope live_grep<cr>", desc = "Search by Grep" },
      
      -- Word search related
      { "<leader>pw", group = "[W]ord Search" },
      { "<leader>pws", function()
          local builtin = require('telescope.builtin')
          local word = vim.fn.expand("<cword>")
          builtin.grep_string({ search = word })
      end, desc = "Search Current Word" },
      
      -- WORD search related (includes more characters)
      { "<leader>pW", group = "[W]ORD Search" },
      { "<leader>pWs", function()
          local builtin = require('telescope.builtin')
          local word = vim.fn.expand("<cWORD>")
          builtin.grep_string({ search = word })
      end, desc = "Search Current WORD" },

      -- Code related
      { "<leader>c", group = "[C]ode", mode = { "n", "x" } },
      
      -- Debugger related
      { "<leader>d", group = "[D]ebugger" },
      
      -- Rename related
      { "<leader>r", group = "[R]ename" },
      
      -- Search related
      { "<leader>s", group = "[S]earch" },
      
      -- Workspace related
      { "<leader>w", group = "[W]orkspace" },
      
      -- Toggle related
      { "<leader>t", group = "[T]oggle" },
      
      -- Git related
      { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
      { "<leader>g", group = "Git" },
      
      -- Lazygit related
      { "<leader>l", group = "[L]azygit" },
      
      -- Files related
      { "<leader>f", group = "[F]iles" },
      
      -- Buffer related
      { "<leader>b", group = "[B]uffer" },
      
      -- Utilities related
      { "<leader>u", group = "[U]tilities" },
      
      -- Zen related
      { "<leader>z", group = "[Z]en" },
      
      -- Notifications related
      { "<leader>n", group = "[N]otifications" },
      
      -- Quickfix related
      { "<leader>q", group = "[Q]uickfix" },
      
      -- Command History related
      { "<leader>:", group = "[C]ommand History" },
      
      -- Scratch related
      { "<leader>;", group = "[S]cratch" },
      
      -- Other related
      { "<leader>o", group = "[O]ther" },
      
      -- Help related
      { "<leader>h", group = "[H]elp" },
      
      -- Diagnostics related
      { "<leader>x", group = "Diagnostics" },
    })

    -- Add descriptions for the project search subgroups
    wk.register({
      ["<leader>p"] = {
        name = "[P]roject",
        w = {
          name = "[W]ord Search",
          s = "Search Current Word",
        },
        W = {
          name = "[W]ORD Search",
          s = "Search Current WORD",
        },
      },
    })
  end
}
