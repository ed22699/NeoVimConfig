local ls = require("luasnip")
local s = ls.snippet --for creating snippets
local t = ls.text_node --the content of the snippets
local i = ls.insert_node --where cursor goes to
local extras = require("luasnip.extras")
local rep = extras.rep --repeat what was put into i
local fmt = require("luasnip.extras.fmt").fmt --write in more readable way
local c = ls.choice_node --cycle through options
local f = ls.function_node --insert function into snippet
local d = ls.dynamic_node --like function node but returns snippet rather than string
local sn = ls.snippet_node

vim.keymap.set({ "i", "s"}, "<A-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, {silent = true})

vim.keymap.set({ "i", "s"}, "<A-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, {silent = true})
ls.add_snippets("lua", {
    s("hello", {
        t('print("hello '),
        i(1),
        t(' world")')
    })
})

ls.add_snippets("tex", {
    s("beg", {
        t("\\begin{"), i(1), t("}"),
        t({ "", "\t"}), i(0),
        t({ "","\\end{"}), rep(1), t("}"),
    }),
    s("beg2", fmt(
    [[ 
    \begin{{{}}}
    {}
    \end{{{}}}
    ]], {
       i(1), i(0), rep(1)
   }))
})
