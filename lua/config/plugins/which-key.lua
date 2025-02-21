return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    delay = 0,
    icons = {
      mappings = vim.g.have_nerd_font,
      keys = vim.g.have_nerd_font and {} or {
        Up = '<Up> ',
        Down = '<Down> ',
        Left = '<Left> ',
        Right = '<Right> ',
        Back = '<BS> ',
        Delete = '<Del> ',
        Space = '<Space> ',
        Tab = '<Tab> ',
        Return = '<CR> ',
        Escape = '<Esc> ',
      }
    },
    -- Document existing key chains
    spec = {
      { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      { '<leader>g', group = 'Git' },
      { '<leader>l', group = '[L]azygit' },
      { '<leader>f', group = '[F]iles' },
      { '<leader>b', group = '[B]uffer' },
      { '<leader>u', group = '[U]tilities' },
      { '<leader>z', group = '[Z]en' },
      { '<leader>n', group = '[N]otifications' },
      { '<leader>q', group = '[Q]uickfix' },
      { '<leader>:', group = '[C]ommand History' },
      { '<leader>;', group = '[S]cratch' },
      { '<leader>o', group = '[O]ther' },
      { '<leader>h', group = '[H]elp' },
      { '<leader>x', group = 'Diagnostics' },
    }
  }
}
