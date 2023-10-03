return {
  "okuuva/auto-save.nvim",
  cmd = "ASToggle",                         -- optional for lazy loading on command
  event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  opts = {
    -- fjasdlfyour config goes here
    -- or just leave it empty :)
    enabled = true,
    condition = function(buf)
      local fn = vim.fn

      -- don't save for special-buffers
      if fn.getbufvar(buf, "&buftype") ~= '' then

        return false
      end
      return true
    end
  },
  keys = {
    { "<leader>n", ":ASToggle<CR>", desc = "Toggle auto-save" },
  },
}
