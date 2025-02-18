return {
   {
      "m4xshen/autoclose.nvim",
      opts = {
         options = {
            disabled_filetypes = { "text" },
            disable_when_touch = true,
            pair_spaces = true,
         },
         keys = {
            ["'"] = {
               escape = true,
               close = true,
               pair = "''",
               disabled_filetypes = { "markdown", "tex", "csv"},
            },
            ["`"] = {
               escape = false,
               close = true,
               pair = "``",
               disabled_filetypes = {},
            },
            ["<"] = {
               escape = false,
               close = true,
               pair = "<>",
               enabled_filetypes = { "rust" },
            },
            ["$"] = { escape = true, close = true, pair = "$$", enabled_filetypes = {
               -- "tex",
               "markdown"
            }},
            ["$$"] = { escape = true, close = true, pair = "$$$$", enabled_filetypes = {
               -- "tex",
               "markdown"
            }},
         },
      },
   },
   "windwp/nvim-ts-autotag",
   {
      "kylechui/nvim-surround",
      version = "*",
      event = "VeryLazy",
      opts = {
         keymaps = {
            normal = "gs",
            normal_cur = "gss",
         },
      },
   },
}
