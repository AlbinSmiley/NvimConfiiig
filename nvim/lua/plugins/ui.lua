return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme ('tokyonight-night')
    end,
    opts = {},
  },
  -- {
  --   "rcarriga/nvim-notify",
  --   opts = {},
  --   config = function()
  --     vim.notify = require("notify")
  --   end,
  -- },
  {
    "aznhe21/actions-preview.nvim",
    config = function()
      vim.keymap.set(
        { "v", "n" },
        "<Leader>ca",
        require("actions-preview").code_actions
      )
    end,
  },
}
