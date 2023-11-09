% PARADIGMAS DE PROGRAMACI�N LABORATORIO 2
% Nombre: El�as Z��iga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA USER

:- module(tda_user_21141368_ZunigaTobar, [user/3, sacarNumeroDeNombre/2, getUserId/2, getUserName/2, getUserHistory/2]).

user(Nombre, History, [NombreMin|[History]]):-
    string_lower(Nombre, NombreMin).

sacarNumeroDeNombre([Head|Resto], Id):-
    \+ atom_number(Head, Id),
    sacarNumeroDeNombre(Resto, Id).
sacarNumeroDeNombre([Head|_], Id):-
    atom_number(Head, Id),
    number(Id).

getUserId(Name, Id):-
    atom_chars(Name, UserList),
    sacarNumeroDeNombre(UserList, Id).

getUserName([Name|_], Name).

getUserHistory([_|[History]], History).




