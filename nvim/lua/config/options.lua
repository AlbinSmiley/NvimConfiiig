vim.o.relativenumber = true -- Active les numéros de ligne relatifs pour faciliter les déplacements
vim.opt.scrolloff = 8 -- Garde 8 lignes au-dessus et en dessous du curseur lors du défilement
vim.o.number = true -- Active l'affichage des numéros de ligne
vim.wo.wrap = true -- Active le retour à la ligne automatique
vim.wo.linebreak = true -- Coupe les lignes à des points spécifiques pour éviter de diviser les mots
vim.wo.list = false -- Désactive l'affichage des caractères invisibles

vim.o.shiftwidth = 2 -- Définit le nombre d'espaces insérés pour chaque niveau d'indentation
vim.o.tabstop = 2 -- Définit le nombre d'espaces qu'un onglet occupe
vim.o.softtabstop = 2 -- Permet un comportement de tabulation flexible
vim.o.expandtab = true -- Convertit les onglets en espaces

vim.o.hlsearch = false -- Désactive la surbrillance des recherches après leur exécution
vim.wo.number = true -- Active (répété pour souligner l'importance ou corriger)

vim.o.mouse = 'a' -- Active le support de la souris dans tous les modes

vim.o.clipboard = 'unnamedplus' -- Synchronise le presse-papiers Neovim avec celui du système

vim.o.breakindent = true -- Active l'indentation pour les lignes coupées

vim.o.undofile = true -- Active la sauvegarde de l'historique des modifications pour annulation

vim.o.ignorecase = true -- Recherche insensible à la casse...
vim.o.smartcase = true -- ...sauf si la recherche contient des majuscules

vim.wo.signcolumn = 'yes' -- Active toujours la colonne des signes pour éviter des décalages

vim.o.updatetime = 250 -- Réduit le temps avant de sauvegarder ou déclencher des événements
vim.o.timeout = true -- Active le délai d'attente pour les séquences de touches
vim.o.timeoutlen = 300 -- Définit le délai d'attente pour les séquences de touches à 300 ms

vim.o.completeopt = 'menuone,noselect' -- Améliore l'expérience de complétion automatique

vim.o.termguicolors = true -- Active le support des couleurs 24 bits dans le terminal

vim.cmd[[let php_htmlInStrings = 1]] -- Active le surlignage HTML dans les chaînes PHP
vim.cmd[[let html_phpInStrings = 1]] -- Active le surlignage PHP dans les chaînes HTML

-- Les commandes commentées configureraient la transparence de l'arrière-plan pour certains éléments
-- Configure la transparence
-- vim.cmd[[hi Normal guibg=NONE "ctermbg=NONE]]
-- vim.cmd[[hi NonText guibg=NONE "ctermbg=NONE]]
