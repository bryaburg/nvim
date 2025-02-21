return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            hidden = true,
            theme = "ivy",
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          ["notify"] = {
            -- You can add custom notify telescope config here
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep Files" })
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "Recent Files" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fn", "<cmd>Telescope notify<cr>", { desc = "Search Notifications" })

      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("notify")
    end,
  },
}
