local ls = require("luasnip")
local s = ls.snippet                          --for creating snippets
local t = ls.text_node                        --the content of the snippets
local i = ls.insert_node                      --where cursor goes to
local extras = require("luasnip.extras")
local rep = extras.rep                        --repeat what was put into i
local fmt = require("luasnip.extras.fmt").fmt --write in more readable way
local c = ls.choice_node                      --cycle through options
local f = ls.function_node                    --insert function into snippet
local d = ls.dynamic_node                     --like function node but returns snippet rather than string
local sn = ls.snippet_node
local rec_ls


vim.keymap.set({ "i", "s" }, "<A-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })
ls.add_snippets("lua", {
    s("hello", {
        t('print("hello '),
        i(1),
        t(' world")')
    })
})

ls.add_snippets("cs", {
    s("func", fmt(
        [[
    /// <summary>
    /// []
    /// </summary>
    public [] []([]){
        []
    }
    ]], { i(4), i(1), i(2), i(3), i(5) }, { delimiters = '[]' }
    )),
})

ls.add_snippets("html", {
    s("begin", fmt([[
<!DOCTYPE html>
<html>
    <body>
        {}
    </body>
</html>
]], { i(1) }, { delimiters = '{}' })),
    s("p", fmt([[
<p>
{}
</p>
]], { i(1) }, { delimiters = '{}' })),
s("h", fmt([[
<h{}>{}</h{}>
]], {i(1), i(2), rep(1)}, {delimiters="{}"})),
s("img", fmt([[
<img fmt="{}" alt="{}">
]], {i(1), i(2)}, {delimiters="{}"})),
s("video", fmt([[
<video controls>
  <source src="{}" type="{}">
Your browser does not support the video tag.
</video>
]], {i(1), i(2)}, {delimiters="{}"}))
})

ls.add_snippets("tex", {
    s("beg", fmt(
        [[
    \begin{{{}}}
    {}
    \end{{{}}}
    ]], {
            i(1), i(0), rep(1)
        })),

    --    s("ls", {
    --        t("\\begin{"), i(1), t("}"),
    --        t({ "", "\t\\item " }), i(2), d(3, rec_ls, {}),
    --        t({ "", "\\end{itemize}" }), i(0)
    --    }),
    s("bullet", fmt([[
        \begin{itemize}
            \item <>
        \end{itemize}
        ]], { i(1) }, { delimiters = '<>' })),

    s("list", fmt([[
        \begin{enumerate}
            \item <>
        \end{enumerate}
        ]], { i(1) }, { delimiters = '<>' })),

    s("item", {
        t("\\item "), i(1)
    }),

    s("bold", {
        t("\\textbf{"), i(1), t("}}")
    }),
    s("bi", {
        t("\\textbf{\\textit{"), i(1), t("}}")
    })
})
