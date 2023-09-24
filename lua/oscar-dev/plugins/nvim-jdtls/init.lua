return {
  'mfussenegger/nvim-jdtls',
  config = function()
    vim.api.nvim_set_keymap('n', '<A-o>', '<Cmd>lua require"jdtls".organize_imports()<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', 'crv', '<Cmd>lua require"jdtls".extract_variable()<CR>', { noremap = true })
    vim.api.nvim_set_keymap('v', 'crv', '<Esc><Cmd>lua require"jdtls".extract_variable(true)<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', 'crc', '<Cmd>lua require"jdtls".extract_constant()<CR>', { noremap = true })
    vim.api.nvim_set_keymap('v', 'crc', '<Esc><Cmd>lua require"jdtls".extract_constant(true)<CR>', { noremap = true })
    vim.api.nvim_set_keymap('v', 'crm', '<Esc><Cmd>lua require"jdtls".extract_method(true)<CR>', { noremap = true })

    -- If using nvim-dap
    vim.api.nvim_set_keymap('n', '<leader>df', '<Cmd>lua require"jdtls".test_class()<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<leader>dn', '<Cmd>lua require"jdtls".test_nearest_method()<CR>', { noremap = true })
  end
}
