return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  config = function()
    require("nvim-web-devicons").setup({
      -- your personalization configuration here
      override = {
        -- override specific file icons here
      },
      default = true,
    })
  end,
}