P = function(v) -- Définit une fonction globale `P` pour le débogage
   print(vim.inspect(v)) -- Utilise `vim.inspect` pour convertir l'argument en une chaîne lisible
   return v -- Retourne l'argument, permettant à cette fonction d'être insérée dans des expressions sans les modifier
end
