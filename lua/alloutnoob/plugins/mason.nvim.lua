return {
  'williamboman/mason.nvim',
  config = function()
    require('mason').setup({
      -- Optional configuration options
      ensure_installed = {
      "asm-lsp",
      "clangd",
      "lua-language-server",
      "bash-language-server",
      "tailwindcss-language-server",
      "docker-compose-language-server",
      "json-lsp",
      "html-lsp",
      "eslint-lsp",
      "markdown-oxide",
      "gopls",
      "pyright",
      "sqls",
      "yaml-language-server"
      },-- add more lsp server if you want more language
      automatic_installation = true,
    })
  end
}
