/* html//1, reply_html_page  */
:- use_module(library(http/html_write)).
/* html_requires  */
:- use_module(library(http/html_head)).

:- ensure_loaded(gabarito(boot5rest)).

:- use_module(bd(compra), []).

entradaCompra(_):-
    reply_html_page(
        boot5rest,
        [ title('Compras')],
        [ div(class(container),
              [ \html_requires(css('entrada.css')),
                \html_requires(js('bookmark.js')),
                \line,
                \titulo_da_paginacp('Minhas Compras '),
                \line,
                \tabela_de_bookmarksCp

              ]) ]).

titulo_da_paginacp(Titulo) -->
    html( div(class('text-center align-items-center w-100'),
              h1('display-3', Titulo))).

tabela_de_bookmarksCp -->
    html(div(class('container-fluid py-3'),
             [
               \cabeca_da_tabelacp('     ', '/','voltar'),
               \cabeca_da_tabelacp('Compras', '/compra','Nova Compra'),
               \tabelacp
             ]
            )).


cabeca_da_tabelacp(Titulo,Link,Nome) -->
    html( div(class('d-flex'),
              [ div(class('me-auto p-2'), h2(b(Titulo))),
                div(class('p-2'),
                    a([ href(Link), class('btn btn-primary')],
                      Nome))
              ]) ).


tabelacp -->
    html(div(class('table-responsive-md'),
             table(class('table table-striped w-100'),
                   [ \cabecalhocp,
                     tbody(\corpo_tabelacp)
                   ]))).

cabecalhocp -->
    html(thead(tr([ th([scope(col)], '#'),
                    th([scope(col)], 'Quantidade'),
                    th([scope(col)], 'Nome'),
                    th([scope(col)], 'Data'),
                    th([scope(col)], 'Acoes')
                  ]))).



corpo_tabelacp -->
    {
        findall( tr([th(scope(row), Id), td(Abrev), td(Nome),td(Data),td(Acoes)]),
                 linhacp(Id, Nome, Abrev,Data, Acoes),
                 Linhas )
    },
    html(Linhas).




linhacp(Id,Qtd, Nome,Data, Acoes):-
    compra:compra(Id,Nome,_,_,_,_,_,Qtd,Data),
    acoescp(Id,Acoes).


acoescp(Id, Campo):-
    Campo = [ a([ class('text-success'), title('Alterar'),
                  href('/compra/editar/~w' - Id),
                  'data-toggle'(tooltip)],
                [ \lapis ]),
              a([ class('text-danger ms-1'), title('Excluir'),
                  href('/api/v1/api_compra/~w' - Id),
                  onClick("apagar( event, '/compras' )"),
                  'data-toggle'(tooltip)],
                [ \lixeira ])
            ].
