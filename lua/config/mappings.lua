vim.g.mapleader = ' '
vim.g.maplocalleader = 'à'

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })



-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })



vim.keymap.set('n', '<leader>pw', vim.cmd.Ex)
vim.keymap.set('n', '<leader>pv', ':NvimTreeFocus<CR>')
vim.keymap.set('v', '<leader>y', '\"+y')

--vim.keymap.set('v', '<leader>p', '\"+p')

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")

vim.keymap.set("v", "jk", "<ESC>")
vim.keymap.set("v", "kj", "<ESC>")

vim.keymap.set("i", "JK", "<ESC>")
vim.keymap.set("i", "KJ", "<ESC>")

vim.keymap.set("v", "JK", "<ESC>")
vim.keymap.set("v", "KJ", "<ESC>")

vim.keymap.set("n", "<leader>st", "maI# <ESC>`a:delmarks a<CR>l")
vim.keymap.set("n", "<leader>o", "a<CR><ESC>k$")

vim.cmd[[
tmap <C-h> <C-\><C-N><C-h><C-w>l
tmap <C-l> <C-\><C-N><C-l><C-w>l
tmap <C-j> <C-\><C-N><C-j><C-w>l
tmap <C-k> <C-\><C-N><C-k><C-w>l
]]

vim.cmd[[nmap <F2> :NvimTreeToggle<CR>]]

-- Depuis une config m4xshen/dotfiles
local function map(mode, lhs, rhs, opts)
   -- set default value if not specify
   if opts.noremap == nil then
      opts.noremap = true
   end
   if opts.silent == nil then
      opts.silent = true
   end

   vim.keymap.set(mode, lhs, rhs, opts)
end


-- better up/down
vim.keymap.set({ "n", "x" }, "j", function()
   return vim.v.count > 0 and "j" or "gj"
end, { noremap = true, expr = true })
vim.keymap.set({ "n", "x" }, "k", function()
   return vim.v.count > 0 and "k" or "gk"
end, { noremap = true, expr = true })

map("n", "<C-u>", "<C-u>zz", {})
map("n", "<C-d>", "<C-d>zz", {})
map("n", "<C-b>", "<C-b>zz", {})
map("n", "<C-f>", "<C-f>zz", {})

-- leader movements
map("n", "<Leader>w", ":write<CR>", {})
map("n", "<Leader>s", ":source %<CR>", {})
map("n", "<Leader>v", ":cd ~/.config/nvim/<CR>:Telescope find_files<CR>", {})
map("n", "<Leader>m", ":make<CR>", {})
map("n", "<Leader>b", ":!busted %<CR>", {})

-- system clipboard
map({ "n", "v" }, "<Leader>y", '"+y', {})
map({ "n" }, "<Leader>Y", '"+y$', {})

map({ "n", "v" }, "<Leader>p", '"+p', {})
map({ "n", "v" }, "<Leader>P", '"+P', {})

-- window movements
map("n", "<C-k>", "<C-w>k", {})
map("n", "<C-j>", "<C-w>j", {})
map("n", "<C-h>", "<C-w>h", {})
map("n", "<C-l>", "<C-w>l", {})
map("n", "<C-c>", "<C-w>c", {})

map("n", "<leader>z", ":ZenMode<CR>", {})

-- Open compiler
vim.api.nvim_set_keymap('n', '<F6>', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
vim.api.nvim_set_keymap('n', '<S-F6>',
     "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
  .. "<cmd>CompilerRedo<cr>",
 { noremap = true, silent = true })

-- Toggle compiler results
vim.api.nvim_set_keymap('n', '<S-F7>', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

-- local on_attach = function(_, bufnr)
--   -- NOTE: Remember that lua is a real programming language, and as such it is possible
--   -- to define small helper and utility functions so you don't have to repeat yourself
--   -- many times.
--   --
--   -- In this case, we create a function that lets us more easily define mappings specific
--   -- for LSP related items. It sets the mode, buffer and description for us each time.
--
--   local nmap = function(keys, func, desc)
--     if desc then
--       desc = 'LSP: ' .. desc
--     end
--
--     vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
--   end
--
--   nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
--   nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
--
--   nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
--   nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
--   nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
--   nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
--   nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
--   nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
--
--   -- See `:help K` for why this keymap
--   nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
--   nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
--
--   -- Lesser used LSP functionality
--   nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
--   nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
--   nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
--   nmap('<leader>wl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   end, '[W]orkspace [L]ist Folders')
--
--   -- Create a command `:Format` local to the LSP buffer
--   vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
--     vim.lsp.buf.format()
--   end, { desc = 'Format current buffer with LSP' })
-- end
