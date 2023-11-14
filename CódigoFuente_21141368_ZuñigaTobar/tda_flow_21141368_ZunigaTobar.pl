% PARADIGMAS DE PROGRAMACI�N LABORATORIO 2
% Nombre: El�as Z��iga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA FLOW

:- module(tda_flow_21141368_ZunigaTobar, [getFlowId/2, getFlowsIds/3, detectorOptionsDuplicados/3, flow/4, flowAddOption/3]).
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

% Regla: detectorOptionsDuplicados
% Dominios: Flows X IdsAcc (Lista) X IdsSalida (Lista)
% Meta Principal: filtroOptionsDuplicados
% Meta Secundaria: getFlowId(FlowCabeza, Id),
%                  getOptionsIds(OptiionsAcc, [], Ids), not(member(Id,
%                  Ids))
% Descripci�n: Predicado constructor que detecta las
%              opciones duplicadas para la construcci�n de un flujo
detectorOptionsDuplicados([], OptionsAcc, OptionsAcc):- !.
detectorOptionsDuplicados([OptionAgregar|RestoOptions], OptionsAcc, OptionsSalida):-
    getOptionId(OptionAgregar, Id),
    getOptionsIds(OptionsAcc, [], Ids),
    not(member(Id, Ids)),
    detectorOptionsDuplicados(RestoOptions, [OptionAgregar|OptionsAcc], OptionsSalida).

% Regla: flow
% Dominios: Id (Numero) X NameMessage (String) X Options (Lista) X Flow
% Meta Principal: flow
% Meta Secundaria: detectorOptionsDuplicados(Options, [],
%                  OptionsFiltrados)
% Descripci�n: Predicado constructor de un flujo de un chatbot
flow(Id, NameMessage, Options, [Id, NameMessage, OptionsSalida]):-
    detectorOptionsDuplicados(Options, [], OptionsSalida).

% Regla: flowAddOption
% Dominios: Flow X NewOption X NewFlow
% Meta Principal: flowAddOption
% Meta Secundaria: flow(Id, Message, [NewOption|Options], NewFlow)
% Descripci�n: Predicado modificador que agrega una nueva opci�n al
%              flujo seleccionado
flowAddOption([Id, Message, Options], NewOption, NewFlow):-
    flow(Id, Message, [NewOption|Options], NewFlow).
