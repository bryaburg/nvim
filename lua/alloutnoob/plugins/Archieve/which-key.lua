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
      -- Help related (moved from <leader>nh to <leader>h)
      { "<leader>h", group = "[H]elp" },
      { "<leader>h?", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>hk", "<cmd>Telescope keymaps<cr>", desc = "Key Mappings" },
      { "<leader>hm", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader>hh", "<cmd>Telescope highlights<cr>", desc = "Highlight Groups" },
      { "<leader>hc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>ho", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader>ha", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },

      -- Project related
      { "<leader>p", group = "[P]roject" },
      { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find File" },
      { "<leader>ps", "<cmd>Telescope live_grep<cr>", desc = "Search by Grep" },
      { "<leader>pws", function()
          local builtin = require('telescope.builtin')
          local word = vim.fn.expand("<cword>")
          builtin.grep_string({ search = word })
      end, desc = "Search Current Word" },
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
      
      -- Diagnostics related
      { "<leader>x", group = "Diagnostics" },
    })

    -- Register help subgroup descriptions
    wk.register({
      ["<leader>h"] = {
        name = "[H]elp",
        ["?"] = "Help Pages",
        k = "Key Mappings",
        m = "Man Pages",
        h = "Highlight Groups",
        c = "Commands",
        o = "Options",
        a = "Auto Commands",
      },
    })
  end
}
