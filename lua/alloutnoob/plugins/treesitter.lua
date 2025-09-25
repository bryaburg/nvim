-- File: ~/.config/nvim/lua/alloutnoob/config/lazy.lua
return {
  -- ... other plugins ...

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate', -- Essential for installing/updating parsers
    config = function()
      -- Put the entire content of your treesitter.lua here,
      -- starting from require'nvim-treesitter.configs'.setup { ... }
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
        sync_install = false,
        auto_install = true,
        ignore_install = { "javascript" },
        highlight = {
          enable = true,
          disable = function(lang, buf)
              local max_filesize = 100 * 1024 -- 100 KB
              local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
              if ok and stats and stats.size > max_filesize then
                  return true
              end
          end,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },

  -- ... other plugins ...
}