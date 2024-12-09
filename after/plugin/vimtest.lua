return {
    "vim-test/vim-test",
    dependencies = {
        "preservim/vimux"
    },
    vim.keymap.set("n", "<leader>vt", "<cmd>TestNearest<CR>", {silent = true}),
    vim.keymap.set("n", "<leader>vT", "<cmd>TestFile<CR>", {silent = true}),
    vim.keymap.set("n", "<leader>va", "<cmd>TestSuite<CR>", {silent = true}),
    vim.keymap.set("n", "<leader>vl", "<cmd>TestLast<CR>", {silent = true}),
    vim.keymap.set("n", "<leader>vg", "<cmd>TestVisit<CR>", {silent = true}),
    vim.cmd("let test#strategy = 'vimux'")
}
