-- Active la surbrillance uniquement lors de la recherche
vim.api.nvim_create_autocmd("CmdlineEnter", {
   -- Déclenche cette autocommand lors de l'entrée en mode ligne de commande
   callback = function()
      local cmd = vim.v.event.cmdtype
      -- Active la surbrillance si la commande est une recherche ("/" ou "?")
      if cmd == "/" or cmd == "?" then
         vim.opt.hlsearch = true
      end
   end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
   -- Déclenche cette autocommand lors de la sortie du mode ligne de commande
   callback = function()
      local cmd = vim.v.event.cmdtype
      -- Désactive la surbrillance après une recherche
      if cmd == "/" or cmd == "?" then
         vim.opt.hlsearch = false
      end
   end,
})

-- Met en surbrillance le texte lors du yank (copie)
vim.api.nvim_create_autocmd("TextYankPost", {
   -- Déclenche cette autocommand après un yank
   callback = function()
      -- Utilise la fonction on_yank pour mettre en surbrillance avec un délai de 200ms
      vim.highlight.on_yank({ timeout = 200 })
   end,
})

-- Désactive le commentaire automatique lors de l'entrée dans un nouveau buffer
vim.api.nvim_create_autocmd("BufEnter", {
   -- Déclenche cette autocommand à l'ouverture d'un buffer
   callback = function()
      -- Désactive les options de formatage automatique de commentaire
      vim.opt.formatoptions:remove { "c", "r", "o" }
   end,
})

-- Active la vérification orthographique pour les fichiers markdown et texte
vim.api.nvim_create_autocmd("BufEnter", {
   -- Applique cette configuration uniquement aux fichiers markdown
   pattern = { "*.md" },
   callback = function()
      -- Active la vérification orthographique
      vim.opt_local.spell = false
   end,
})

-- Définit un raccourci pour exécuter un fichier C++ dans un terminal
-- vim.api.nvim_create_autocmd("BufEnter", {
--    -- Applique cette configuration uniquement aux fichiers C++
--    pattern = { "*.cpp", "*.cc" },
--    callback = function()
--       -- Définit une touche pour exécuter le fichier compilé dans un terminal
--       vim.keymap.set("n", "<Leader>e", ":terminal ./a.out<CR>", { silent = true })
--    end,
-- })

vim.api.nvim_create_autocmd("BufEnter", {
   pattern = "*.cpp",
   callback = function()
      vim.keymap.set("n", "<Leader>e", function()
         local filename = vim.fn.expand('%')
         local filenameWithoutExtension = vim.fn.expand('%:t:r')
         local filedir = vim.fn.expand('%:p:h')
         local currentDir = vim.fn.getcwd()
         vim.cmd("cd " .. filedir)
         vim.cmd("terminal g++ -std=c++20 " .. filename .. " -o " .. filenameWithoutExtension .. " && ./" .. filenameWithoutExtension)
         vim.cmd("cd " .. currentDir)
      end, { silent = true, buffer = true })
   end,
})

-- Configure l'indentation pour les fichiers Lua
vim.api.nvim_create_autocmd("BufEnter", {
   -- Applique cette configuration uniquement aux fichiers Lua
   pattern = { "*.lua" },
   callback = function()
      -- Définit l'indentation à 3 espaces pour l'alignement et l'insertion de tabulations
      vim.opt.shiftwidth = 3
      vim.opt.tabstop = 3
      vim.opt.softtabstop = 3
   end,
})

-- (Commenté) Définit un raccourci pour exécuter un fichier Go dans un terminal
-- keymap for .go file
-- vim.api.nvim_create_autocmd("BufEnter", {
--    pattern = { "*.go" },
--    callback = function()
--       vim.keymap.set(
--          "n",
--          "<Leader>e",
--          ":terminal go run %<CR>",
--          { silent = true }
--       )
--    end,
-- })

-- Définit un raccourci pour exécuter un fichier Python dans un terminal
vim.api.nvim_create_autocmd("BufEnter", {
   -- Applique cette configuration uniquement aux fichiers Python
   pattern = { "*.py" },
   callback = function()
      -- Définit une touche pour exécuter le script Python courant dans un terminal
      vim.keymap.set("n", "<Leader>e", ":terminal python3 %<CR>", { silent = true })
   end,
})

vim.api.nvim_create_autocmd("BufEnter", {
   -- Applique cette configuration uniquement aux fichiers Python
   pattern = { "*.js", "*.mjs" },
   callback = function()
      -- Définit une touche pour exécuter le script Python courant dans un terminal
      vim.keymap.set("n", "<Leader>e", ":terminal node %<CR>", { silent = true })
   end,
})

vim.api.nvim_create_autocmd("BufEnter", {
   pattern = { "*.tex" },
   callback = function()
      vim.keymap.set('n', '<leader>ll', ":VimtexCompile<CR>", { buffer = true })
   end,
})

vim.api.nvim_create_autocmd("BufEnter", {
   pattern = { "*.md" },
   callback = function()
      vim.keymap.set('n', '<leader>ll', ":PeekOpen<CR>", { buffer = true })
      vim.keymap.set('n', '<leader>kl', ":PeekClose<CR>", { buffer = true })
   end,
})

vim.api.nvim_create_autocmd("BufEnter", {
   pattern = "*.java",
   callback = function()
      vim.keymap.set("n", "<Leader>e", function()
         local filename = vim.fn.expand('%')
         local filenameWithoutExtension = vim.fn.expand('%:t:r')
         local filedir = vim.fn.expand('%:p:h')
         local currentDir = vim.fn.getcwd()
         vim.cmd("cd " .. filedir)
         vim.cmd("terminal javac " .. filename .. " && java " .. filenameWithoutExtension)
         vim.cmd("cd " .. currentDir)
      end, { silent = true, buffer = true })
   end,
})

vim.api.nvim_create_autocmd("BufEnter", {
   pattern = "*.java",
   callback = function()
      vim.keymap.set("n", "<Leader>i", function()
         local filedir = vim.fn.expand('%:p:h')
         local currentDir = vim.fn.getcwd()
         vim.cmd("cd " .. filedir)
         vim.cmd("terminal ./run.sh")
         vim.cmd("cd " .. currentDir)
      end, { silent = true, buffer = true })
   end,
})

vim.api.nvim_create_autocmd("BufEnter", {
   pattern = "*.java",
   callback = function()
      vim.keymap.set("n", "<Leader>j", function()
         local javafx_sdk_path = "~/sdk/lib" -- Ajustez selon votre configuration
         local modules = "javafx.controls,javafx.fxml,javafx.graphics,opencsv-3.8" -- Ajoutez ou retirez des modules selon les besoins
         local filename = vim.fn.expand('%')
         local filenameWithoutExtension = vim.fn.expand('%:t:r')
         local filedir = vim.fn.expand('%:p:h')
         local currentDir = vim.fn.getcwd()
         vim.cmd("cd " .. filedir)
         local compile_cmd = string.format("javac --module-path %s --add-modules %s %s", javafx_sdk_path, modules, filename)
         local run_cmd = string.format("java --module-path %s --add-modules %s -cp . %s", javafx_sdk_path, modules, filenameWithoutExtension)
         vim.cmd("terminal " .. compile_cmd .. " && " .. run_cmd)
         vim.cmd("cd " .. currentDir)
      end, { silent = true, buffer = true })
   end,
})
