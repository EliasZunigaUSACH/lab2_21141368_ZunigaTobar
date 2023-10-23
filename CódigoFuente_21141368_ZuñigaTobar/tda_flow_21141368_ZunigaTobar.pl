% PARADIGMAS DE PROGRAMACI�N LABORATORIO 2
% Nombre: El�as Z��iga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA FLOW

pertenece(Elemento, [Elemento, _]).

pertenece(Elemento, [_|Resto]):-
    pertenece(Elemento, Resto).

noPertenece(Elemento, Lista):-
    \+ pertenece(Elemento, Lista).

agregarFlowSinDuplicados([], ListaAcc, ListaAcc):- !.

agregarFlowSinDuplicados([ElementoParaAgregar|RestoParaAgregar], Acc, ListaSalida):-
    noPertenece(ElementoParaAgregar, Acc),
    agregarFlowSinDuplicados(RestoParaAgregar, [ElementoParaAgregar|Acc], ListaSalida).

agregarFlowSinDuplicados([ElementoParaAgregar|RestoParaAgregar], Acc, ListaSalida):-
    pertenece(ElementoParaAgregar, Acc),
    agregarFlowSinDuplicados(RestoParaAgregar, [ElementoParaAgregar|Acc], ListaSalida).


agregarFlow(NewOption, Options, NewOptions).

flow(Id, NameMessage, Options, Flows).

flowAddOption(Flow, NewOption, NewFlow):-
    flow(Id, NameMessage, Options, Flow),
    agregarFlow(NewOption, Options, NewOptions),
    flow(Id, NameMessage, NewOptions, NewFlow).
