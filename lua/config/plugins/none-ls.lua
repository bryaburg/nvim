return {
  "nvimtools/none-ls.nvim",
  enabled = false,
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua, --lua
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black, --python
        null_ls.builtins.formatting.isort, --python imports
        null_ls.builtins.formatting.gomodifytags, --go
        null_ls.builtins.diagnostics.eslint_d, --npn
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}

