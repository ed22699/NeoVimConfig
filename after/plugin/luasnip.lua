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
rec_ls = function()
    return sn(nil, {
        c(1, {
            -- important!! Having the sn(...) as the first choice will cause infinite recursion.
            t({ "" }),
            -- The same dynamicNode as in the snippet (also note: self reference).
            sn(nil, { t({ "", "\t\\item " }), i(2), d(3, rec_ls, {}) }),
        }),
    });
end

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

ls.add_snippets("tex", {
    s("beg", fmt(
        [[
    \begin{{{}}}
    {}
    \end{{{}}}
    ]], {
            i(1), i(0), rep(1)
        })),

    s("ls", {
        t("\\begin{"), i(1), t("}"),
        t({"","\t\\item "}), i(2), d(3, rec_ls, {}),
        t({ "", "\\end{itemize}" }), i(0)
    }),
    s("bold", {
        t("\\textbf{"), i(1), t("}}")
    }),
    s("bi", {
        t("\\textbf{\\textit{"), i(1), t("}}")
    })
})
