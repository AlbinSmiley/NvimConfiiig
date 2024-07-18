require("config.options") -- Charge les configurations d'options personnalisées de Neovim
require("config.mappings") -- Charge les mappages de touches personnalisés
require("config.autocmds") -- Charge les commandes automatiques personnalisées (autocmds) pour Neovim
require("config.utils") -- Charge les fonctions utilitaires personnalisées qui peuvent être utilisées dans d'autres configurations
require("config.lazy") -- Charge la configuration pour lazy.nvim, un gestionnaire de plugins paresseux

-- Tente de trouver un fichier de configuration utilisateur personnalisé dans le répertoire de runtime
local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

-- Si le fichier de configuration utilisateur personnalisé existe, exécute-le
if custom_init_path then
  dofile(custom_init_path)
end

-- Ligne commentée servant à définir le chemin vers lazy.nvim si nécessaire
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
