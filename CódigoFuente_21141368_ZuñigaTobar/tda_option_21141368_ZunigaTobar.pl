% PARADIGMAS DE PROGRAMACIÓN LABORATORIO 2
% Nombre: Elías Zúñiga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA OPTION

:- module(tda_option_21141368_ZunigaTobar, [getOptionId/2, getOptionsIds/3, option/6]).

% Regla: getOptionId
% Dominios: Option (Lista) X id (Número)
% Meta Principal: getOptionId
% Meta Secundaria: option(Id, _, _, _, _, Option)
% Descripción: Predicado selector que obtiene la id de una opción
getOptionId(Option, Id):-
    option(Id, _, _, _, _, Option).

% Regla: getOptionsIds
% Dominios: Options (Lista) X IdAcc (Lista) X IdsSalida (Lista)
% Meta Principal: getOptionsIds
% Meta Secundaria: getOptionId(OptionHead, Id)
% Descripción: Predicado selector que obtiene las ids de una lista de
%              opciones
getOptionsIds([], IdsAcc, IdsAcc):- !.
getOptionsIds([OptionHead|OptionsTail], IdsAcc, IdsSalida):-
    getOptionId(OptionHead, Id),
    getOptionsIds(OptionsTail, [Id|IdsAcc], IdsSalida).

% Regla: Option
% Dominios: Code (Número) X Message (String) X Codelink (Número) X
% InitialFlowCode (Número) X Keywords (Lista) X Option
% Meta Principal: Option
% Meta Secundaria: Ninguna
% Descripción: Predicado constructor de una opción para flujo de un
%              chatbot. Cada opción se enlaza a un chatbot y flujo
%              especificados por sus respectivos códigos.
option(Code, Message, Codelink, InitialFlowCode, Keywords, [Code, Message, Codelink, InitialFlowCode, Keywords]).

getOptionKeywords(Option, Keywords):-
    option(_, _, _, _, Keywords, Option).
