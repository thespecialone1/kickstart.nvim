return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    open_mapping = [[<C-\>]], -- Press Ctrl+\ to toggle terminal
    direction = 'float', -- Floating terminal window
    shade_terminals = true,
    close_on_exit = true,
    float_opts = {
      border = 'curved',
      winblend = 3,
      highlights = {
        border = 'Normal',
        background = 'Normal',
      },
    },
  },
}
