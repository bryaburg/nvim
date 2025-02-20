return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    window = {
      border = "single",
      position = "bottom",
    },
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show("", { mode = "n", auto = true })
      end,
      desc = "Show All Keymaps",
    },
  },
}
