return {
  "anuvyklack/windows.nvim",
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim"
  },
  config = function()
    vim.o.winwidth = 10
    vim.o.winminwidth = 10
    vim.o.equalalways = false
    require('windows').setup()
    local function cmd(command)
      return table.concat({ '<Cmd>', command, '<CR>' })
    end

    vim.keymap.set('n', '<leader>ww', cmd 'WindowsMaximize')
    vim.keymap.set('n', '<leader>wv', cmd 'WindowsMaximizeVertically')
    vim.keymap.set('n', '<leader>wh', cmd 'WindowsMaximizeHorizontally')
    vim.keymap.set('n', '<leader>we', cmd 'WindowsEqualize')
  end
}
