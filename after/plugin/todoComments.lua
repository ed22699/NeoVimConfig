require("todo-comments").setup({
highlight = {
    multiline = false,
    pattern = [[.*<(KEYWORDS)\s*]],
},
search = {
    pattern = [[\b(KEYWORDS)\b]],
},
})
