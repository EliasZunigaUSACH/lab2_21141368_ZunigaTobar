% PARADIGMAS DE PROGRAMACIÓN LABORATORIO 2
% Nombre: Elías Zúñiga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA USER

:- module(tda_user_21141368_ZunigaTobar, [user/3, sacarNumeroDeNombre/3, getUserId/2]).

user(Nombre, History, [NombreMin|History]):-
    string_lower(Nombre, NombreMin).

sacarNumeroDeNombre([], Id, Id):- !.
sacarNumeroDeNombre([Head|Resto], Id, IdOut):-
    \+ number(Head),
    sacarNumeroDeNombre(Resto, Id, IdOut).
sacarNumeroDeNombre([Head|Resto], Id, IdOut):-
    number(Head),
    sacarNumeroDeNombre(Resto, [Head|Id], IdOut).

getUserId(User, Id):-
    user(_, User, _, _),
    atom_chars(User, UserList),
    sacarNumeroDeNombre(UserList, [], Id).




