/* html//1, reply_html_page  */
:- use_module(library(http/html_write)).
/* html_requires  */
:- use_module(library(http/html_head)).

:- ensure_loaded(gabarito(boot5rest)).

:- use_module(bd(pessoa), []).

entradaPessoa(_):-
    reply_html_page(
        boot5rest,
        [ title('Pessoas')],
        [ div(class(container),
              [ \html_requires(css('entrada.css')),
                \html_requires(js('bookmark.js')),
                \titulo_da_paginapess('Minhas Pessoas'),
                \tabela_de_bookmarkspess

              ]) ]).

titulo_da_paginapess(Titulo) -->
    html( div(class('text-center align-items-center w-100'),
              h1('display-3', Titulo))).

tabela_de_bookmarkspess -->
    html(div(class('container-fluid py-3'),
             [
               \cabeca_da_tabelapess('     ', '/','voltar'),
               \cabeca_da_tabelapess('Pessoa', '/pessoa','Nova Pessoa'),
               \tabelapess
             ]
            )).


cabeca_da_tabelapess(Titulo,Link,Nome) -->
    html( div(class('d-flex'),
              [ div(class('me-auto p-2'), h2(b(Titulo))),
                div(class('p-2'),
                    a([ href(Link), class('btn btn-primary')],
                      Nome))
              ]) ).


tabelapess -->
    html(div(class('table-responsive-md'),
             table(class('table table-striped w-100'),
                   [ \cabecalhopess,
                     tbody(\corpo_tabelapess)
                   ]))).

cabecalhopess -->
    html(thead(tr([ th([scope(col)], '#'),
                    th([scope(col)], 'Tipo'),
                    th([scope(col)], 'Nome Pessoa'),
                    th([scope(col)], 'Raz�o Social'),
                    th([scope(col)], 'Data Nascimento'),
                    th([scope(col)], 'Sexo'),
                    th([scope(col)], 'CPF'),
                    th([scope(col)], 'CNPJ'),
                    th([scope(col)], 'Estado'),
                    th([scope(col)], 'Cidade'),
                    th([scope(col)], 'Bairro'),
                    th([scope(col)], 'Rua'),
                    th([scope(col)], 'N�'),
                    th([scope(col)], 'Email'),
                    th([scope(col)], 'Fone'),
                    th([scope(col)], 'Fone 2'),
                    th([scope(col)], 'FAX'),
                    th([scope(col)], 'Celular'),
                    th([scope(col)], 'Data Registro'),
                    th([scope(col)], 'Ind. Cad.'),
                    th([scope(col)], 'Acoes')
                  ]))).



corpo_tabelapess -->
    {
        findall( tr([th(scope(row), Id), td(Tipo), td(NomePess), td(RazSocial), td(DataNasc), td(Sexo), td(Cpf), td(Cnpj), td(Estado), td(Cidade), td(Bairro), td(Rua), td(Nro), td(Email), td(Fone), td(Fone2), td(Fax), td(Celular), td(DtRegistro),td(IndCad),td(Acoes)]),
                 linhapess(Id,Tipo, NomePess, RazSocial, DataNasc, Sexo, Cpf, Cnpj, Estado, Cidade, Bairro, Rua, Nro, Email, Fone, Fone2, Fax,Celular, DtRegistro,IndCad,Acoes),
                 Linhas )
    },
    html(Linhas).




linhapess(Ido,Tipo, NomePess, RazSocial, DataNasc, Sexo, Cpf, Cnpj, Estado, Cidade, Bairro, Rua, Nro, Email, Fone, Fone2, Fax,Celular, DtRegistro,IndCad,Acoes):-
    pessoa:pessoa(Ido,Tipo, NomePess, RazSocial, DataNasc, Sexo, Cpf, Cnpj, Estado, Cidade, Bairro, Rua, Nro, Email, Fone, Fone2, Fax,Celular, DtRegistro,IndCad),
    acoespess(Ido,Acoes).


acoespess(Id, Campo):-
    Campo = [ a([ class('text-success'), title('Alterar'),
                  href('/pessoa/editar/~w' - Id),
                  'data-toggle'(tooltip)],
                [ \lapis ]),
              a([ class('text-danger ms-1'), title('Excluir'),
                  href('/api/v1/api_pessoa/~w' - Id),
                  onClick("apagar( event, '/pessoas' )"),
                  'data-toggle'(tooltip)],
                [ \lixeira ])
            ].


% Ãcones do Bootstrap 5
/*
lapis -->
    html(svg([ xmlns('http://www.w3.org/2000/svg'),
               width(16),
               height(16),
               fill(currentColor),
               class('bi bi-pencil'),
               viewBox('0 0 16 16')
             ],
             path(d(['M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0',
             ' 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5',
             ' 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4',
             ' 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761',
             ' 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5',
             ' 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z']),
                  []))).

lixeira -->
    html(svg([ xmlns('http://www.w3.org/2000/svg'),
               width(16),
               height(16),
               fill(currentColor),
               class('bi bi-trash'),
               viewBox('0 0 16 16')
             ],
             [ path(d(['M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1',
                       ' .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5',
                       ' 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z']),
                    []),
               path(['fill-rule'(evenodd),
                     d(['M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0',
                        ' 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1',
                        ' 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4',
                        ' 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882',
                        ' 4H4.118zM2.5 3V2h11v1h-11z'])],
                    [])])).

*/
