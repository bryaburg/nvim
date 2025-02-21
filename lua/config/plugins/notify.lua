return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  keys = {
    {
      "<leader>un",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss all Notifications",
    },
    {
      "<leader>nh",
      function()
        require("notify").history()
      end,
      desc = "Notification History",
    },
  },
  opts = {
    timeout = 3000,
    max_width = 80,
  },
  config = function(_, opts)
    require("notify").setup(opts)
    vim.notify = require("notify")
  end,
}
