return {
  'Exafunction/codeium.vim',
  event = 'BufEnter',
  config = function()
    vim.keymap.set('i', '<C-l>', 'codeium#Accept()', { expr = true, silent = true, noremap = true })
    vim.keymap.set('i', '<C-.>', '<Cmd>call codeium#CycleCompletions(1)<CR>', { noremap = true })
    vim.keymap.set('i', '<C-,>', '<Cmd>call codeium#CycleCompletions(-1)<CR>', { noremap = true })
    vim.keymap.set('i', '<C-x>', '<Cmd>call codeium#Clear()<CR>', { noremap = true })
  end
}
