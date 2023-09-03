return {
  "rcarriga/nvim-notify",
  priority = 100, -- cargar despues del colorscheme
  config = function()
    require("notify").setup({
      background_colour = "#000000",
    })
    vim.notify = require("notify")
  end
}
