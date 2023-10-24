% PARADIGMAS DE PROGRAMACI�N LABORATORIO 2
% Nombre: El�as Z��iga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA FLOW

:- use_module(tda_option_21141368_ZunigaTobar).

/*
pertenece(Elemento, [Elemento, _]).

pertenece(Elemento, [_|Resto]):-
    pertenece(Elemento, Resto).

noPertenece(Elemento, Lista):-
    \+ pertenece(Elemento, Lista).
*/

getFlowId(Flow, Id):-
    flow(Id, _, _, Flow).

getFlowsIds([], IdsAcc, IdsAcc):- !.
getFlowsIds([FlowCabeza|FlowsCola], IdsAcc, IdsSalida):-
    getFlowId(FlowCabeza, Id),
    getFlowsIds(FlowsCola, [Id|IdsAcc], IdsSalida).
/*
agregarFlowSinDuplicados([], FlowsAcc, FlowsAcc):- !.
agregarFlowSinDuplicados([FlowAgregar|RestoFlows], FlowsAcc, FlowsSalida):-
    noPertenece(FlowAgregar, FlowsAcc),
    agregarFlowSinDuplicados(RestoFlows, [FlowAgregar|FlowsAcc], FlowsSalida).
agregarFlowSinDuplicados([FlowAgregar|RestoFlows], FlowsAcc, FlowsSalida):-
    pertenece(FlowAgregar, FlowsAcc),
    agregarFlowSinDuplicados(RestoFlows, [FlowAgregar|FlowsAcc],
    FlowsSalida).N
*/
agregarFlowSinDuplicados([], FlowsAcc, FlowsAcc):- !.
agregarFlowSinDuplicados([FlowAgregar|RestoFlows], FlowsAcc, FlowsSalida):-
    getFlowsIds([FlowAgregar|RestoFlows], Ids),
    noPertenece([]).

flowAddOption(Flow, NewOption, NewFlow):-
    flow(Id, NameMessage, Options, Flow),
    agregarFlow(NewOption, Options, NewOptions),
    flow(Id, NameMessage, NewOptions, NewFlow).

flow(Id, NameMessage, Options, [Id, NameMessage, Options]).

agregarFlow(NewOption, Options, NewOptions).
