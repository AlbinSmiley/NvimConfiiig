-- Définition du chemin où lazy.nvim sera stocké localement
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Vérifie si lazy.nvim est déjà installé en cherchant le dossier spécifié par lazypath
if not vim.loop.fs_stat(lazypath) then
  -- Si lazy.nvim n'est pas trouvé, exécute une commande système pour le cloner depuis GitHub
  vim.fn.system({
    "git", -- Utilise git pour cloner le dépôt
    "clone", -- Commande git pour cloner un dépôt
    "--filter=blob:none", -- Optimise le clonage en ne téléchargeant pas le contenu des fichiers
    "https://github.com/folke/lazy.nvim.git", -- URL du dépôt GitHub de lazy.nvim
    "--branch=stable", -- Spécifie de cloner la dernière version stable
    lazypath, -- Définit le chemin local où cloner le dépôt
  })
end

-- Ajoute le chemin d'installation de lazy.nvim au début du 'runtimepath' de Neovim
-- Cela permet à Neovim de charger lazy.nvim au démarrage
vim.opt.rtp:prepend(lazypath)

-- Charge le gestionnaire de plugins lazy.nvim et configure les plugins
-- Le fichier 'plugins' (supposé être plugins.lua) contient la configuration des plugins à charger
require("lazy").setup("plugins")
