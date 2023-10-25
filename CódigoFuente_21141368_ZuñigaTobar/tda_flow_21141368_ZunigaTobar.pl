% PARADIGMAS DE PROGRAMACIÓN LABORATORIO 2
% Nombre: Elías Zúñiga Tobar
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
    FlowsSalida).
*/
verificarDuplicidadOption(OptionHead, OptionsTail):-
    getOptionId(OptionHead, Id),
    getOptionsIds(OptionsTail, [], Ids),
    noPertenece(Id, Ids).

agregarOptionsSinDuplicados([], OptionsAcc, OptionsAcc).
agregarOptionsSinDuplicados([OptionAgregar|RestoOptions], OptionsAcc, OptionsSalida):-
    verificarDuplicidadOption(OptionAgregar, OptionsAcc),
    agregarOptionsSinDuplicados(RestoOptions, [OptionAgregar|OptionsAcc], OptionsSalida).
/*
verificarDuplicidadOption(OptionHead, OptionsTail):-
    getOptionId(OptionHead, Id),
    getOptionsIds(OptionsTail, [], Ids),
    pertenece(Id, Ids).

agregarOptionsSinDuplicados([OptionAgregar|RestoOptions], OptionsAcc, OptionsSalida):-
    verificarDuplicidadOption(OptionAgregar, OptionsAcc),
    agregarOptionsSinDuplicados(RestoOptions, OptionsAcc, OptionsSalida).
*/
agregarFlow(NewOption, Options, [NewOption|Options]).

flowAddOption(Flow, NewOption, NewFlow):-
    flow(Id, NameMessage, Options, Flow),
    agregarFlow(NewOption, Options, NewOptions),
    flow(Id, NameMessage, NewOptions, NewFlow).

flow(Id, NameMessage, Options, [Id, NameMessage, OptionsFiltrados]):-
    agregarOptionsSinDuplicados(Options, [], OptionsFiltrados).

