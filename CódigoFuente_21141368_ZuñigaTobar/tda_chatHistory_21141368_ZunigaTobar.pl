% PARADIGMAS DE PROGRAMACI�N LABORATORIO 2
% Nombre: El�as Z��iga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA CHATHISTORY

:- module(tda_chatHistory_21141368_ZunigaTobar, [recMessage/3, isHistoryNull/1, isHistoryNotNull/1]).

recMessage(NewMessage, History, UpdatedHistory):-
    append(History, [NewMessage], UpdatedHistory).

isHistoryNull(History):-
    length(History, 0).

isHistoryNotNull(History):-
    \+ length(History, 0).
