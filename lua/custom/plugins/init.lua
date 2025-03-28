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
  -- nvim-cmp configuration for autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer', -- Suggest words from the current file (includes comments)
      'hrsh7th/cmp-path', -- Path completions
      'hrsh7th/cmp-nvim-lsp', -- LSP-based completions
      'saadparwaiz1/cmp_luasnip', -- Snippet completions
      'L3MON4D3/LuaSnip', -- Snippet engine
    },
    opts = function()
      local cmp = require 'cmp'
      return {
        mapping = cmp.mapping.preset.insert {
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<CR>'] = cmp.mapping.confirm { select = true },
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' }, -- LSP suggestions
          { name = 'buffer' }, -- Buffer words (includes comments)
          { name = 'luasnip' }, -- Snippet completions
          { name = 'path' }, -- File system paths
        },
        completion = {
          keyword_length = 1, -- Trigger completion quickly
        },
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              buffer = '[Buffer]',
              nvim_lsp = '[LSP]',
              luasnip = '[Snippet]',
              path = '[Path]',
            })[entry.source.name]
            return vim_item
          end,
        },
      }
    end,
  },
}
