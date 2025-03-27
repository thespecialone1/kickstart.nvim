-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      open_mapping = [[<C-\>]], -- Press Ctrl+\ to toggle terminal
      direction = 'float', -- Floating terminal
      shade_terminals = true,
      close_on_exit = true,
      start_in_insert = true,
      float_opts = {
        border = 'rounded', -- Curved border
        winblend = 10, -- Transparency effect (0-100, lower is less transparent)
        width = function()
          return math.floor(vim.o.columns * 0.6) -- 60% of screen width
        end,
        height = function()
          return math.floor(vim.o.lines * 0.4) -- 40% of screen height
        end,
        row = function()
          return math.floor((vim.o.lines - (vim.o.lines * 0.4)) / 2) -- Centered vertically
        end,
        col = function()
          return math.floor((vim.o.columns - (vim.o.columns * 0.6)) / 2) -- Centered horizontally
        end,
        highlights = {
          border = 'Normal', -- Use normal theme color for border
          background = 'Normal', -- Use normal theme color for background
        },
      },
    },
  },
}
