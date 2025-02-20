return {
  {
    "williamboman/mason.nvim",
    lazy = true,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    opts = {
      auto_install = true,
      ensure_installed = { "lua_ls", "pyright" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    config = function()
      require "plugins.config.lspconfig"
      require "custom.config.lspconfig"

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.asm_lsp.setup({
        capabilities = capabilities,
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.cmake.setup({
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      lspconfig.dockerls.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.htmx.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.marksman.setup({
        capabilities = capabilities,
      })
      lspconfig.pylsp.setup({
        capabilities = capabilities,
      })
      lspconfig.harper_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.yamlls.setup({
        capabilities = capabilities,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
