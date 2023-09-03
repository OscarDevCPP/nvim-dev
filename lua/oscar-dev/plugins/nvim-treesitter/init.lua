return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      --asegurar instalación
      ensure_installed = { "lua", "vim", "vimdoc", "query", "css", "javascript", "html", "java", "python", "typescript" },
      sync_install = false,

      highlight = { enable = true },

      indent = { enable = true },

      incremental_selection = {
        enable = true,
        -- Primero activar gnn, luego funciona los otros comandos: grn, grc, grm
        keymaps = {
          init_selection = "gnn", -- set to `false` to disable one of the mappings
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },

      -- Depende nvim-treesitter-refactor
      refactor = {

        highlight_definitions = {
          enable = true,
          -- Set to false if you have an `updatetime` of ~100.
          clear_on_cursor_move = true,
        },

        smart_rename = {
          enable = true,
          -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
          keymaps = {
            smart_rename = "grr",
          },
        },

        --highlight_current_scope = { enable = true },

        navigation = {
          enable = true,
          -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
          keymaps = {
            goto_definition = "gnd",
            list_definitions = "gnD",
            list_definitions_toc = "gO",
            goto_next_usage = "<a-*>",
            goto_previous_usage = "<a-#>",
          },
        },

        autotag = {
          enable = true,
          enable_rename = true,
          enable_close = true,
          enable_close_on_slash = true,
          filetypes = { "html", "xml", "javascript", "typescript", "javascriptreact", "typescriptreact", "markdown" },
        }
      },

      textobjects = {
        select      = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = { query = "@function.outer", desc = "Selecciona toda la función" },
            ['if'] = { query = "@function.inner", desc = "Selecciona el interior de una función" },
            ['ac'] = { query = "@class.outer", desc = "Selecciona toda la clase" },
            ['ic'] = { query = "@class.inner", desc = "Selecciona el interior de una clase" },
            ['is'] = { query = "@statement.outer" },
            ['as'] = { query = "@scopename.inner" },
          }
        },

        swap        = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@function.outer",
          },
          swap_previous = {
            ["<leader>A"] = "@function.outer",
          },
        },

        move        = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["<leader>m"] = "@function.outer",
          },
          goto_previous_start = {
            ["<leader>M"] = "@function.outer",
          },
        },

      },

    })
  end
}
