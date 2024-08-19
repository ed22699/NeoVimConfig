local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- keymap for add file (_a)
vim.keymap.set("n", "<leader>a", mark.add_file)

-- keymap for quick menu (C-m)
vim.keymap.set("n", "<leader>c", ui.toggle_quick_menu)

-- keymap for the saved pages (_num)
vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
