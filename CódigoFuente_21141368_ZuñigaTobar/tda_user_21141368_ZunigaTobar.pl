% PARADIGMAS DE PROGRAMACI�N LABORATORIO 2
% Nombre: El�as Z��iga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA USER

:- module(tda_user_21141368_ZunigaTobar, [makeUser/3, user/3, sacarNumeroDeNombre/3, getUserId/2]).

makeUser(Name, History, [Name|History]).

user(Nombre, History, User):-
    string_lower(Nombre, NombreMin),
    makeUser(NombreMin, History, User).

sacarNumeroDeNombre([], Id, Id):- !.
sacarNumeroDeNombre([Head|Resto], Id, IdOut):-
    \+ number(Head),
    sacarNumeroDeNombre(Resto, Id, IdOut).
sacarNumeroDeNombre([Head|Resto], Id, IdOut):-
    number(Head),
    sacarNumeroDeNombre(Resto, [Head|Id], IdOut).

getUserId(User, Id):-
    makeUser(Name, _, User),
    atom_chars(Name, UserList),
    sacarNumeroDeNombre(UserList, [], Id).




