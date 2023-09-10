return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
    vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end)
  end
}
