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
   --    url = "https://codeberg.org/jthvai/lavender.nvim",
   --    name = "lavender",
   --    branch = "stable", -- versioned tags + docs updates from main
   --    lazy = false,
   --    priority = 1000,
   --    config = function ()
   --       vim.cmd.colorscheme ("lavender")
   --    end,
   --    opts = {},
   -- },
   -- { 
   --    "catppuccin/nvim",
   --    name = "catppuccin",
   --    priority = 1000,
   --    config = function ()
   --       vim.cmd.colorscheme ("catppuccin")
   --    end,
   --    opts = {},
   -- },
   -- {
   --    'maxmx03/fluoromachine.nvim',
   --    lazy = false,
   --    priority = 1000,
   --    config = function ()
   --       local fm = require 'fluoromachine'
   --
   --       fm.setup {
   --          glow = true,
   --          theme = 'fluoromachine',
   --          transparent = false,
   --       }
   --
   --       vim.cmd.colorscheme 'fluoromachine'
   --    end
   -- },
   -- {
   --    "oxfist/night-owl.nvim",
   --    lazy = false, -- make sure we load this during startup if it is your main colorscheme
   --    priority = 1000, -- make sure to load this before all the other start plugins
   --    config = function()
   --       -- load the colorscheme here
   --       require("night-owl").setup()
   --       vim.cmd.colorscheme("night-owl")
   --    end,
   -- },
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
