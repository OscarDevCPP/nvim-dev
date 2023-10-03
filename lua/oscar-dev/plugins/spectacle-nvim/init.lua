return {
  "RutaTang/spectacle.nvim",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim'
  },
  config = function()
    vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>:lua require('spectacle').SpectacleTelescope()<cr>", {})
    vim.api.nvim_set_keymap("n", "<leader>s", "<cmd>:lua require('spectacle').SpectacleSave()<cr>", {})
    vim.api.nvim_set_keymap("n", "<leader>S", "<cmd>:lua require('spectacle').SpectacleSaveAs()<cr>", {})
  end
}
