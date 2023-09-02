return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
      require("onedarkpro").setup({
        colors = {
          dark_orange = "require('onedarkpro.helpers').darken('orange', 40,'onedark')",
        },
        highlights = {
          --Visual = { fg = "#FF0000", bg = "#FFFF00", italic = true }
          Visual = { bg = "${dark_orange}", italic = true },
          LineNr = { fg = "red" }
        },
        styles = {
          types = "NONE",
          methods = "NONE",
          numbers = "NONE",
          strings = "NONE",
          comments = "italic",
          keywords = "bold,italic",
          constants = "NONE",
          functions = "italic",
          operators = "NONE",
          variables = "NONE",
          parameters = "NONE",
          conditionals = "italic",
          virtual_text = "NONE",
        },
        options = {
          cursorline = true,                 -- Use cursorline highlighting?
          transparency = true,               -- Use a transparent background?
          terminal_colors = true,            -- Use the theme's colors for Neovim's :terminal?
          highlight_inactive_windows = true, -- When the window is out of focus, change the normal background?
        }
      })
      vim.cmd("colorscheme onedark_vivid")
    end
  }
}
