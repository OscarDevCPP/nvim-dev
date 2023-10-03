return {
  "folke/zen-mode.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    plugins = {
      gitsings  = { enabled = true },
      alacritty = {
        enabled = true,
        font = 18
      }
    },

    on_open = function()
      require("notify")("MODO ZEN ACTIVADO")
    end,
    on_close = function()
      require("notify")("SALIENDO DE MODO ZEN")
    end
  }
}
