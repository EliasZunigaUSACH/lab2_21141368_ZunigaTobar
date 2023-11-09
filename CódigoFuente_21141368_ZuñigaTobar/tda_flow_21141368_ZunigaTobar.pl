% PARADIGMAS DE PROGRAMACI�N LABORATORIO 2
% Nombre: El�as Z��iga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA FLOW

:- module(tda_flow_21141368_ZunigaTobar, [getFlowId/2, getFlowsIds/3, filtroOptionsDuplicados/3, agregarOption/3, flow/4, flowAddOption/3]).
:- use_module(tda_option_21141368_ZunigaTobar).

% Regla: getFlowId
% Dominios: Flow X Id (N�mero)
% Meta Principal: getFlowId
% Meta Secundaria: Ninguna
% Descripci�n: Predicado selector que obtiene la id de un flujo
getFlowId([Id|_], Id).

% Regla: getFlowsIds
% Dominios: Flows X IdsAcc (Lista) X IdsSalida (Lista)
% Meta Principal: getFlowsIds
% Meta Secundaria: getFlowId(FlowCabeza, Id)
% Descripci�n: Predicado selector que obtiene las ids de un grupo de
% flujos
getFlowsIds([], IdsAcc, IdsAcc):- !.
getFlowsIds([FlowCabeza|FlowsCola], IdsAcc, IdsSalida):-
    getFlowId(FlowCabeza, Id),
    getFlowsIds(FlowsCola, [Id|IdsAcc], IdsSalida).

% Regla: filtroOptionsDuplicados
% Dominios: Flows X IdsAcc (Lista) X IdsSalida (Lista)
% Meta Principal: filtroOptionsDuplicados
% Meta Secundaria: getFlowId(FlowCabeza, Id),
%                  getOptionsIds(OptiionsAcc, [], Ids), not(member(Id,
%                  Ids))
% Descripci�n: Predicado constructor que filtra las
%              opciones duplicadas para la construcci�n de un flujo
filtroOptionsDuplicados([], OptionsAcc, OptionsAcc):- !.
filtroOptionsDuplicados([OptionAgregar|RestoOptions], OptionsAcc, OptionsSalida):-
    getOptionId(OptionAgregar, Id),
    getOptionsIds(OptionsAcc, [], Ids),
%    noPertenece(Id, Ids),
    not(member(Id, Ids)),
    filtroOptionsDuplicados(RestoOptions, [OptionAgregar|OptionsAcc], OptionsSalida).
filtroOptionsDuplicados([OptionAgregar|RestoOptions], OptionsAcc, OptionsSalida):-
    getOptionId(OptionAgregar, Id),
    getOptionsIds(OptionsAcc, [], Ids),
%    pertenece(Id, Ids),
    member(Id, Ids),
    filtroOptionsDuplicados(RestoOptions, OptionsAcc, OptionsSalida).

% Regla: agregarOption
% Dominios: NewOption X Options (Lista) X [NewOption|Options] (Lista)
% Meta Principal: agregarOption
% Meta Secundaria: Ninguna
% Descripci�n: Predicado constructor que crea una lista actualizada de
%              opciones
agregarOption(NewOption, Options, [NewOption|Options]).

% Regla: flow
% Dominios: Id (Numero) X NameMessage (String) X Options (Lista) X Flow
% Meta Principal: flow
% Meta Secundaria: filtroOptionsDuplicados(Options, [],
% OptionsFiltrados)
% Descripci�n: Predicado constructor que crea
flow(Id, NameMessage, Options, [Id, NameMessage, OptionsFiltrados]):-
    filtroOptionsDuplicados(Options, [], OptionsFiltrados).

% Regla: flowAddOption
% Dominios: Flow X NewOption X NewFlow
% Meta Principal: flowAddOption
% Meta Secundaria: flow(Id, Message, [NewOption|Options], NewFlow)
% Descripci�n: Predicado modificador que agrega una nueva opci�n al
%              flujo seleccionado
flowAddOption([Id, Message, Options], NewOption, NewFlow):-
    flow(Id, Message, [NewOption|Options], NewFlow).
