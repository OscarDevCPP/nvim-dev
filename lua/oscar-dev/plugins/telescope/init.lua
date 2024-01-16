return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require('telescope')

    telescope.setup {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--follow",        -- Follow symbolic links
          "--hidden",        -- Search for hidden files
          "--no-heading",    -- Don't group matches by each file
          "--with-filename", -- Print the file path with the matched lines
          "--line-number",   -- Show line numbers
          "--column",        -- Show column numbers
          "--smart-case",    -- Smart case search

          -- Exclude some patterns from search
          "--glob=!**/.git/*",
          "--glob=!**/.idea/*",
          "--glob=!**/.vscode/*",
          "--glob=!**/build/*",
          "--glob=!**/dist/*",
          "--glob=!**/yarn.lock",
          "--glob=!**/package-lock.json",
          "--glob=!**/.github/*",
          "--glob=!**/.gitlab/*",
          "--glob=!**/node_modules/*",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          -- needed to exclude some files & dirs from general search
          -- when not included or specified in .gitignore
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--glob=!**/.git/*",
            "--glob=!**/.idea/*",
            "--glob=!**/.vscode/*",
            "--glob=!**/build/*",
            "--glob=!**/dist/*",
            "--glob=!**/yarn.lock",
            "--glob=!**/package-lock.json",
            "--glob=!**/.github/*",
            "--glob=!**/.gitlab/*",
            "--glob=!**/node_modules/*",
          },
        },
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
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- even more opts
          }

          -- pseudo code / specification for writing custom displays, like the one
          -- for "codeactions"
          -- specific_opts = {
          --   [kind] = {
          --     make_indexed = function(items) -> indexed_items, width,
          --     make_displayer = function(widths) -> displayer
          --     make_display = function(displayer) -> function(e)
          --     make_ordinal = function(e) -> string
          --   },
          --   -- for example to disable the custom builtin "codeactions" display
          --      do the following
          --   codeactions = false,
          -- }
        }
      }
    }
    vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#00fff7" })
    telescope.load_extension('fzf')
    telescope.load_extension('notify')
    telescope.load_extension('projects')
    telescope.load_extension('dap')
    telescope.load_extension("ui-select")

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
