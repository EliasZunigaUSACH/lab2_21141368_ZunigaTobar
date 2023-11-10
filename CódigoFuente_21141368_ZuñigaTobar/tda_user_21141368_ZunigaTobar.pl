% PARADIGMAS DE PROGRAMACI�N LABORATORIO 2
% Nombre: El�as Z��iga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA USER

:- module(tda_user_21141368_ZunigaTobar, [user/3, sacarNumeroDeNombre/2, getUserId/2, getUserName/2, getUserHistory/2]).

% Regla: user
% Dominios: Nombre (String) X History (Lista) X Lista
% Meta Principal: user
% Meta Secundaria: Ninguna
% Descripci�n: Predicado constructor que crea un usuario
user(Nombre, History, [NombreMin|[History]]):-
    string_lower(Nombre, NombreMin).

% Regla: sacarNumeroDeNombre
% Dominios: Nombre (Lista) X Id (N�mero)
% Meta Principal: sacarNumeroDeNombre
% Meta Secundaria: not(atom_number(Head, Id)), atom_number(Head, Id), number(Id)
% Descripci�n: Predicado selector que retorna la id de un usuario
sacarNumeroDeNombre([Head|Resto], Id):-
    not(atom_number(Head, Id)),
    sacarNumeroDeNombre(Resto, Id).
sacarNumeroDeNombre([Head|_], Id):-
    atom_number(Head, Id),
    number(Id).

% Regla: getUserId
% Dominios: Nombre (String) X Id (N�mero)
% Meta Principal: getUserId
% Meta Secundaria: atom_chars(Name, UserList), sacarNumeroDeNombre(UserList, Id)
% Descripci�n: Predicado modificador que trasnforma el nombre en una
%              lista de caracteres. Luego llama a sacarNumeroDeNombre
getUserId(Name, Id):-
    atom_chars(Name, UserList),
    sacarNumeroDeNombre(UserList, Id).

% Regla: getUserName
% Dominios: User (Lista) X Name (String)
% Meta Principal: getUserName
% Meta Secundaria: Ninguna
% Descripci�n: Predicado selector que retorna el nombre de un usuario
getUserName([Name|_], Name).

% Regla: getUserHistory
% Dominios: User (Lista) X History (Lista)
% Meta Principal: getUserHistory
% Meta Secundaria: Ninguna
% Descripci�n: Predicado selector que retorna el historial de un usuario
getUserHistory([_|[History]], History).




