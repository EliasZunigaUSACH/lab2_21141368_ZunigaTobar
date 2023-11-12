% PARADIGMAS DE PROGRAMACI�N LABORATORIO 2
% Nombre: El�as Z��iga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA OPTION

:- module(tda_option_21141368_ZunigaTobar, [getOptionId/2, getOptionsIds/3, option/6]).

% Regla: getOptionId
% Dominios: Option (Lista) X id (N�mero)
% Meta Principal: getOptionId
% Meta Secundaria: option(Id, _, _, _, _, Option)
% Descripci�n: Predicado selector que obtiene la id de una opci�n
getOptionId(Option, Id):-
    option(Id, _, _, _, _, Option).

% Regla: getOptionsIds
% Dominios: Options (Lista) X IdAcc (Lista) X IdsSalida (Lista)
% Meta Principal: getOptionsIds
% Meta Secundaria: getOptionId(OptionHead, Id)
% Descripci�n: Predicado selector que obtiene las ids de una lista de
%              opciones
getOptionsIds([], IdsAcc, IdsAcc):- !.
getOptionsIds([OptionHead|OptionsTail], IdsAcc, IdsSalida):-
    getOptionId(OptionHead, Id),
    getOptionsIds(OptionsTail, [Id|IdsAcc], IdsSalida).

% Regla: Option
% Dominios: Code (N�mero) X Message (String) X Codelink (N�mero) X
% InitialFlowCode (N�mero) X Keywords (Lista) X Option
% Meta Principal: Option
% Meta Secundaria: Ninguna
% Descripci�n: Predicado constructor de una opci�n para flujo de un
%              chatbot. Cada opci�n se enlaza a un chatbot y flujo
%              especificados por sus respectivos c�digos.
option(Code, Message, Codelink, InitialFlowCode, Keywords, [Code, Message, Codelink, InitialFlowCode, Keywords]).

getOptionKeywords(Option, Keywords):-
    option(_, _, _, _, Keywords, Option).
