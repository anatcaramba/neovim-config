local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

return {
  s(
    { trig = 'lstl', dscr = 'Crée un lstlisting', snippetType = 'autosnippet' },
    fmta(
      [[
        \begin{lstlisting}
        <>
        \end{lstlisting}
      ]],
      { i(1) }
    )
  ),
  s(
    { trig = 'lsti', dscr = 'Crée un lstinline', snippetType = 'autosnippet' },
    fmta(
      [[
        \lstinline{<>}
      ]],
      { i(1) }
    )
  ),
  s({ trig = 'href', snippetType = 'autosnippet' }, fmta('\\href{<>}{<>}', { i(1, 'url'), i(2, 'display') })),
  s(
    { trig = 'env', snippetType = 'snippet' },
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
    ]],
      {
        i(1),
        i(2),
        rep(1), -- this node repeats insert node i(1)
      }
    )
  ),
  s({ trig = 'emph', snippetType = 'autosnippet' }, fmta('\\emph{<>}', { i(1) })),
  s({ trig = 'càd', snippetType = 'autosnippet' }, fmta("c'est-à-dire", {})),
  s({ trig = 'ind' }, fmta('\\textbf{Indication(s) : }', {})),
  s({ trig = 'bigo', snippetType = 'autosnippet' }, fmta('\\mathcal{O}(<>)', { i(1) })),
  s({ trig = 'frac' }, fmta('\\frac{<>}{<>}', { i(1), i(2) })),
  s(
    { trig = 'fbox', snippetType = 'autosnippet' },
    fmta(
      [[
  \

  \fbox{
  \begin{minipage}{6.8in}
  \hfill\vspace{<>in}
  \end{minipage}
  }
  ]],
      { i(1) }
    )
  ),
  s({ trig = 'noeud', snippetType = 'autosnippet' }, fmta('n\\oe ud', {})),
  s({ trig = '^', snippetType = 'autosnippet' }, fmta('^{<>}', { i(1) })),
  s({ trig = '_', snippetType = 'autosnippet' }, fmta('_{<>}', { i(1) })),
  -- s({ trig = '`', snippetType = 'autosnippet' }, fmta("`<>'", { i(1) })),
  s({ trig = '...', snippetType = 'autosnippet' }, fmta('\\ldots', {})),
}
