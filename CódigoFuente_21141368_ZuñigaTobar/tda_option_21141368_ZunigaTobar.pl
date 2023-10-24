% PARADIGMAS DE PROGRAMACIÓN LABORATORIO 2
% Nombre: Elías Zúñiga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA OPTION

:- module(tda_option_21141368_ZunigaTobar, [pertenece/2, noPertenece/2]).

pertenece(Elemento, [Elemento, _]).

pertenece(Elemento, [_|Resto]):-
    pertenece(Elemento, Resto).

noPertenece(Elemento, Lista):-
    \+ pertenece(Elemento, Lista).

agregarOptionsSinDuplicados([], ListaAcc, ListaAcc):- !.

agregarOptionsSinDuplicados([OpcionAgregar|RestoOpciones], Acc, ListaSalida):-
    noPertenece(OpcionAgregar, Acc),
    agregarOptionsSinDuplicados(RestoOpciones, [OpcionAgregar|Acc], ListaSalida).

agregarOptionsSinDuplicados([OpcionAgregar|RestoOpciones], Acc, ListaSalida):-
    pertenece(OpcionAgregar, Acc),
    agregarOptionsSinDuplicados(RestoOpciones, [OpcionAgregar|Acc], ListaSalida).

option(Code, Message, Codelink, InitialFlowCode, Keywords, [Code, Message, Codelink, InitialFlowCode, Keywords]).
