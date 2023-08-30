local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- funciones de asignación de atajos para los modos normal , insert y terminal
local function nmap(after, before)
  map("n", after, before, opts)
end

local function imap(after, before)
  map("i", after, before, opts)
end

local function tmap(after, before)
  map("t", after, before, opts)
end

vim.g.mapleader = " "



-- Asignaciones para perfil de usuario
imap("jj", "<Esc>")
imap("jl", "<right>")
imap("jh", "<left>")

nmap("<leader>w", ":w<CR>")
nmap("<leader>q", ":q<CR>")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-h>", "<C-w>h")
nmap("<C-l>", "<C-w>l")

