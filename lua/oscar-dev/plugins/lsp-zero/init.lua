return {

  'VonHeikemen/lsp-zero.nvim',

  branch = 'v2.x',

  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },             -- Required
    { 'williamboman/mason.nvim' },           -- Optional
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },     -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'L3MON4D3/LuaSnip' },     -- Required
  },

  config = function()
    --Llamar a la configuración de mason antes de llamar al modulo de mason
    require('mason').setup({
      ui = {
        border = 'rounded'
      }
    })

    local lsp = require('lsp-zero').preset({
      manage_nvim_cmp = {
        set_extra_mappings = true,
        set_sources = 'recommended'
      }
    })

    --Asegurar llamar a cmp.setup despues de lsp-zero para sobrecargar la configuración predeterminada
    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()

    cmp.setup({
      preselect = 'item',
      completion = {
        completeopt = 'menu,menuone,noinsert'
      },
      mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
        snippet = cmp.config.window.bordered(),
      }
    })


    lsp.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp.default_keymaps({ buffer = bufnr })
      local opts = { buffer = bufnr }
      --atajo de teclado para formatear
      vim.keymap.set({ 'n', 'x' }, 'gq', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
      end, opts)
    end)

    lsp.set_sign_icons({
      error = '✘',
      warn = '▲',
      hint = '⚑',
      info = '»'
    })

    require('lspconfig').lua_ls.setup(
      lsp.nvim_lua_ls({
        single_file_support = false,
        on_attach = function(client, bufnr)
          print('lua_ls initiliazed')
        end,
      })
    )

    --Llamar a este comando al ultimo siempre
    lsp.setup()
  end,

}
