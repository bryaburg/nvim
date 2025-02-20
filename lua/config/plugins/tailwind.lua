return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
        },
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("colorizer").setup({
        user_default_options = {
          tailwind = true,
          mode = "background",
          css = true,
        },
      })
    end,
  },
}
