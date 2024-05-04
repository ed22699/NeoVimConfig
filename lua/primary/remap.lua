vim.g.mapleader = " "

-- Exiting a page
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Moving text in visual
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Take line below and add to current line
vim.keymap.set("n", "J", "mzJ`z")

-- Half page jumping cursor stays centre
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search terms stay in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste and preserve
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Same as copying outside of vim
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
-- Don't think these work
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Find file/folder, this does not work either
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Rename variable
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Create an executable file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Open and close the directory section
vim.keymap.set("n", "<leader>o", "<cmd>NvimTreeOpen<CR>")
vim.keymap.set("n", "<leader>c", "<cmd>NvimTreeClose<CR>")


-- LSP Config
-- K - displays hover info
-- gd - jumps to definition of symbol
-- gD - jumps to the declaration of the symbol 
-- gi - lists all the implementations
-- go - jumps to the definition of the type of the symbol
-- gr - lists all the references to the symbol
-- gs - displays signature info about the symbol
-- <F2> - renames all references 
-- <F3> - format code
-- gl - show diagnostics 
-- [d - move to the previous diagnostic 
-- ]d - move to next diagnostic
-- :LspInstall to install new 

-- Window jumping
-- with sidebar open <C-v> opens new window
-- <d> delete
-- <r> rename
-- <Tab> preview
-- <a> create file or directory
-- basic commands
-- <C-w>v create window vertically
-- hold <C-w> toggle windows
-- <C-w>r move window right
-- <C-w>R move window left
