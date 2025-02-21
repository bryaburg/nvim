return {
  "nvimtools/none-ls.nvim",
  enabled = true,
  config = function()
    local null_ls = require("null-ls")
    local sources = {
      -- Diagnostics only since we're using conform.nvim for formatting
      
      -- JavaScript/HTML/CSS
      null_ls.builtins.diagnostics.eslint_d,
      
      -- Python
      null_ls.builtins.diagnostics.ruff,
      
      -- Lua
      null_ls.builtins.diagnostics.luacheck,
      
      -- Shell
      null_ls.builtins.diagnostics.shellcheck,
      
      -- Markdown
      null_ls.builtins.diagnostics.markdownlint,
      
      -- General
      null_ls.builtins.diagnostics.codespell,
    }

    -- Filter out unavailable sources
    local available_sources = {}
    for _, source in ipairs(sources) do
      if source then
        table.insert(available_sources, source)
      end
    end

    null_ls.setup({
      sources = available_sources,
      on_attach = function(client, bufnr)
        -- We'll let conform.nvim handle formatting
        if client.supports_method("textDocument/formatting") then
          vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { buffer = bufnr })
        end
      end,
    })
  end,
}

