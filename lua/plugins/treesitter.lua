return {
   {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
         require("nvim-treesitter.configs").setup({
            auto_install = true,
            ensure_installed = {
               'lua',
               -- 'latex',
               'java',
               'python',
               'javascript',
               'markdown',
               'markdown_inline',
               -- 'php',
               'c',
               'r',
               'cpp',
               'css',
               'fortran',
               'html',
               'bibtex',
               'json',
               'make',
               -- 'json5',
               -- 'swift'
            },
            highlight = {
               enable = true,
               disable = {"latex"},
               additional_vim_regex_highlighting = { "latex", "markdown" },
            },
            indent = { enable = true },
            autotag = { enable = true },
         })
      end,
   },
   {
      "nvim-treesitter/nvim-treesitter-context",
      config = function()
         vim.cmd("hi TreesitterContextBottom gui=underdashed guisp=#585b70")
      end
   },
}
