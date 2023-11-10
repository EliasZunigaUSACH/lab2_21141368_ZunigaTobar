% PARADIGMAS DE PROGRAMACIÓN LABORATORIO 2
% Nombre: Elías Zúñiga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA CHATHISTORY

:- module(tda_chatHistory_21141368_ZunigaTobar, [recMessage/3, isHistoryNull/1, isHistoryNotNull/1]).

% Regla: recMessage
% Dominios: NewMessage (String) X History (Lista) X UpdatedHistory
%           (Lista)
% Meta Principal: recMessage Meta Secundaria: append(History,
%                 [NewMessage], UpdatedHistory)
% Descripción: Predicado graba la interacción de un ususario
recMessage(NewMessage, History, UpdatedHistory):-
    append(History, [NewMessage], UpdatedHistory).

% Regla: isHistoryNull
% Dominios: History (Lista)
% Meta Principal: isHistoryNull
% Meta Secundaria: length(History, 0)
% Descripción: Predicado de pertenencia que verifica si el historial de
%              un usuario está vacío
isHistoryNull(History):-
    length(History, 0).

% Regla: isHistoryNotNull
% Dominios: History (Lista)
% Meta Principal: isHistoryNotNull
% Meta Secundaria: not(length(History, 0))
% Descripción: Predicado de pertenencia que verifica si el historial de
%              un usuario no está vacío
isHistoryNotNull(History):-
    not(length(History, 0)).
