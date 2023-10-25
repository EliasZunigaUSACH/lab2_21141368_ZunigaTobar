% PARADIGMAS DE PROGRAMACIÓN LABORATORIO 2
% Nombre: Elías Zúñiga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA OPTION

:- module(tda_option_21141368_ZunigaTobar, [pertenece/2, noPertenece/2, getOptionId/2, getOptionsIds/3, option/6]).

pertenece(Elemento, [Elemento, _]).

pertenece(Elemento, [_|Resto]):-
    pertenece(Elemento, Resto).

noPertenece(Elemento, Lista):-
    \+ pertenece(Elemento, Lista).

getOptionId(Option, Id):-
    option(Id, _, _, _, _, Option).

getOptionsIds([], IdsAcc, IdsAcc):- !.
getOptionsIds([OptionHead|OptionsTail], IdsAcc, IdsSalida):-
    getOptionId(OptionHead, Id),
    getOptionsIds(OptionsTail, [Id|IdsAcc], IdsSalida).

option(Code, Message, Codelink, InitialFlowCode, Keywords, [Code, Message, Codelink, InitialFlowCode, Keywords]).
