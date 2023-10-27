% PARADIGMAS DE PROGRAMACIÓN LABORATORIO 2
% Nombre: Elías Zúñiga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA FLOW

:- use_module(tda_option_21141368_ZunigaTobar).
:- module(tda_flow_21141368_ZunigaTobar, [getFlowId/2, getFlowsIds/3, agregarOptionsSinDuplicados/3, agregarOption/3, flow/4, flowAddOption/3, agregarOption/3]).

getFlowId(Flow, Id):-
    flow(Id, _, _, Flow).

getFlowsIds([], IdsAcc, IdsAcc):- !.
getFlowsIds([FlowCabeza|FlowsCola], IdsAcc, IdsSalida):-
    getFlowId(FlowCabeza, Id),
    getFlowsIds(FlowsCola, [Id|IdsAcc], IdsSalida).

agregarOptionsSinDuplicados([], OptionsAcc, OptionsAcc):- !.
agregarOptionsSinDuplicados([OptionAgregar|RestoOptions], OptionsAcc, OptionsSalida):-
    getOptionId(OptionAgregar, Id),
    getOptionsIds(OptionsAcc, [], Ids),
    noPertenece(Id, Ids),
    agregarOptionsSinDuplicados(RestoOptions, [OptionAgregar|OptionsAcc], OptionsSalida).
agregarOptionsSinDuplicados([OptionAgregar|RestoOptions], OptionsAcc, OptionsSalida):-
    getOptionId(OptionAgregar, Id),
    getOptionsIds(OptionsAcc, [], Ids),
    pertenece(Id, Ids),
    agregarOptionsSinDuplicados(RestoOptions, OptionsAcc, OptionsSalida).

agregarOption(NewOption, Options, [NewOption|Options]).

flow(Id, NameMessage, Options, [Id, NameMessage, OptionsFiltrados]):-
    agregarOptionsSinDuplicados(Options, [], OptionsFiltrados).

flowAddOption(Flow, NewOption, NewFlow):-
    flow(Id, NameMessage, Options, Flow),
    agregarOption(NewOption, Options, NewOptions),
    flow(Id, NameMessage, NewOptions, NewFlow).


