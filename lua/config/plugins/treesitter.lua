return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      -- First, reset any existing treesitter configuration
      vim.treesitter.language.register('bash', 'sh')  -- Register bash as an alias for sh

      require("nvim-treesitter.configs").setup({
        -- A list of parser names, or "all"
        ensure_installed = {
          "bash",          -- Shell scripting
          "c",            -- C programming language
          "cpp",          -- C++ programming language
          "css",          -- Cascading Style Sheets
          "go",           -- Go programming language
          "html",         -- HTML markup
          "javascript",   -- JavaScript programming language
          "latex",        -- LaTeX document preparation
          "lua",          -- Lua programming language
          "norg",         -- Neorg markup language (Neovim org-mode)
          "python",       -- Python programming language
          "rust",         -- Rust programming language
          "scss",         -- Sass CSS preprocessor
          "svelte",       -- Svelte web framework
          "tsx",          -- TypeScript with JSX
          "typescript",   -- TypeScript programming language
          "typst",        -- Typst markup language
          "vimdoc",       -- Vim documentation
          "vim",          -- Vim script
          "vue",          -- Vue.js framework
          "regex",        -- Regular expressions
          "markdown",     -- Markdown markup
          "markdown_inline", -- Inline markdown syntax
          "query",        -- Treesitter query language
          -- "org",      -- Removing org as it's causing issues
          "comment",      -- Comment syntax
          "diff",         -- Diff syntax highlighting
          "json",         -- JSON files
          "yaml",         -- YAML files
          "toml",         -- TOML files
          "latex",        -- LaTeX files
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        auto_install = true,

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

        indent = { 
          enable = true,
          disable = {},
        },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<nop>",
            node_decremental = "<bs>",
          },
        },

        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
        },
      })
    end,
  },
}
