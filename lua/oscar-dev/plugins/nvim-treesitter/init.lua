return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          --asegurar instalación
          ensure_installed = {"lua", "vim", "vimdoc", "query", "css", "javascript", "html" , "java" ,"python" ,"typescript"},
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
              filetypes = { "html" , "xml" ,"javascript","typescript","javascriptreact", "typescriptreact","markdown"},
            }

          },

        })
    end
}
