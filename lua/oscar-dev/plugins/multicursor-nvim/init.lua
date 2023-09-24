return {
  "smoka7/multicursors.nvim",
  event = "VeryLazy",
  dependencies = {
    'smoka7/hydra.nvim',
  },
  opts = {},
  cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
  keys = {
    {
      mode = { 'v', 'n' },
      '<Leader>m',
      '<cmd>MCstart<cr>',
      desc = 'Create a selection for selected text or word under the cursor',
    },
  },
  config = function()
    require('multicursors').setup {
      hint_config = false,
    }

    local function is_active()
      local ok, hydra = pcall(require, 'hydra.statusline')
      return ok and hydra.is_active()
    end

    local function get_name()
      local ok, hydra = pcall(require, 'hydra.statusline')
      if ok then
        return hydra.get_name()
      end
      return ''
    end

    --- for lualine add this component
    require('lualine').setup({
      sections = {
        lualine_c = {
          { get_name, cond = is_active },
        }
      }
    })
  end
}
