return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require('telescope')

    telescope.setup {
      pickers = {
        current_buffer_fuzzy_find = {
          theme = "dropdown",
        },
        lsp_references = {
          theme = "dropdown"
        },
        builtin = {
          theme = "ivy"
        }
      },
    }

    telescope.load_extension('fzf')
    telescope.load_extension('notify')
    telescope.load_extension('projects')
    telescope.load_extension('dap')

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find, {})

    vim.keymap.set('n', '<leader>fl', builtin.treesitter, {})
    vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})

    vim.keymap.set('n', '<leader>ft', builtin.builtin, {})
    vim.keymap.set('n', '<leader>fn', '<Cmd>Telescope notify<cr>')
    vim.keymap.set('n', '<leader>fp', '<Cmd>Telescope projects<cr>')
    vim.keymap.set('n', '<leader>fd', '<Cmd>Telescope dap commands<cr>')
  end
}
