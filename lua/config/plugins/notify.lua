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
    -- Animation style (see :help notify-config-stages)
    stages = "fade_in_slide_out",
    
    -- Default timeout for notifications
    timeout = 3000,

    -- For stages that change opacity this is treated as the highlight behind the window
    background_colour = "#000000",

    -- Icons for the different levels
    icons = {
      ERROR = "",
      WARN = "",
      INFO = "",
      DEBUG = "",
      TRACE = "✎",
    },

    -- Minimum width for notification windows
    minimum_width = 50,
    
    -- Maximum width for notification windows
    max_width = 80,
    
    -- Maximum height for notification windows
    max_height = nil,

    -- Render style
    render = "default",

    -- Notification window border
    top_down = true,
  },
  config = function(_, opts)
    local notify = require("notify")
    notify.setup(opts)
    -- Set as default notify function
    vim.notify = notify

    -- Add Telescope integration
    require("telescope").load_extension("notify")

    -- Add highlight groups for notifications
    vim.cmd([[
      highlight NotifyERRORBorder guifg=#8A1F1F
      highlight NotifyWARNBorder guifg=#79491D
      highlight NotifyINFOBorder guifg=#4F6752
      highlight NotifyDEBUGBorder guifg=#8B8B8B
      highlight NotifyTRACEBorder guifg=#4F3552
      highlight NotifyERRORIcon guifg=#F70067
      highlight NotifyWARNIcon guifg=#F79000
      highlight NotifyINFOIcon guifg=#A9FF68
      highlight NotifyDEBUGIcon guifg=#8B8B8B
      highlight NotifyTRACEIcon guifg=#D484FF
      highlight NotifyERRORTitle guifg=#F70067
      highlight NotifyWARNTitle guifg=#F79000
      highlight NotifyINFOTitle guifg=#A9FF68
      highlight NotifyDEBUGTitle guifg=#8B8B8B
      highlight NotifyTRACETitle guifg=#D484FF
      highlight link NotifyERRORBody Normal
      highlight link NotifyWARNBody Normal
      highlight link NotifyINFOBody Normal
      highlight link NotifyDEBUGBody Normal
      highlight link NotifyTRACEBody Normal
    ]])
  end,
}