-- lazy.nvim
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
    }
  },
  opts = {
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = false,
    },
  },
  config = function(_, opts)
    require("noice").setup(opts)
    
    -- Ensure required TreeSitter parsers are installed
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "regex", "bash" },
      auto_install = true,
    })
  end
}
