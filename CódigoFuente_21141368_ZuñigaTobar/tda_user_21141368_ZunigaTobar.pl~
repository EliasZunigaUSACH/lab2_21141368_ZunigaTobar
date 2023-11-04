% PARADIGMAS DE PROGRAMACIÓN LABORATORIO 2
% Nombre: Elías Zúñiga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA USER

:- module(tda_user_21141368_ZunigaTobar, [makeUser/3, user/3, sacarNumeroDeNombre/2, getUserId/2]).

makeUser(Name, History, [Name|[History]]).

user(Nombre, History, User):-
    string_lower(Nombre, NombreMin),
    makeUser(NombreMin, History, User).

sacarNumeroDeNombre([Head|Resto], Id):-
    \+ atom_number(Head, Id),
    sacarNumeroDeNombre(Resto, Id).
sacarNumeroDeNombre([Head|_], Id):-
    atom_number(Head, Id),
    number(Id).

getUserId(User, Id):-
    makeUser(Name, _, User),
    atom_chars(Name, UserList),
    sacarNumeroDeNombre(UserList, Id).




