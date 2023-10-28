% PARADIGMAS DE PROGRAMACIÓN LABORATORIO 2
% Nombre: Elías Zúñiga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA SYSTEM

:- use_module(tda_chatbot_21141368_ZunigaTobar).
:- use_module(tda_user_21141368_ZunigaTobar).

putDateTime(DateTime):-
    get_time(Time),
    stamp_date_time(Time, Date, local),
    format_time(atom(DateTime), "%T %d-%M-%Y", Date).

makeSystem(Name, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, [Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots]):-
    putDateTime(Date).

makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, [Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots]).

system(Name, InitialChatbotCodeLink, Chatbots, System):-
    makeSystem(Name, [], [], InitialChatbotCodeLink, Chatbots, System).

getSystemName(System, Name):-
    makeSystem(Name, _, _, _, _, System).

getSystemMembers(System, Members):-
    makeSystem(_, _, Members, _, _, System).

getSystemChatbots(System, Chatbots):-
    makeSystem(_, _, _, _, Chatbots, System).

getMembersIds([], Ids, Ids).
getMembersIds([User|Members], Ids, IdsOut):-
    getUserId(User, Id),
    getMembersIds(Members, [Id|Ids], IdsOut).

registerUser(User, Members, [User|Members]).

systemAddUser(System, User, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    user(User, UserMin),
    getUserId(UserMin, Id),
    getMembersIds(Members, [], Ids),
    noPertenece(Id, Ids),
    registerUser(UserMin, Members, UpdatedMembers),
    makeSystem(Name, Date, UpdatedMembers, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).
systemAddUser(System, User, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    user(User, UserMin),
    getUserId(UserMin, Id),
    getMembersIds(Members, [], Ids),
    pertenece(Id, Ids),
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).

isLogedUser(System, ConectedUser):-
    makeSystem(_, _, _, ConectedUser, _, _, System),
    \+ length(ConectedUser, 0).

systemLogin(System, User, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    \+ isLogedUser(System, ConectedUser),
    pertenece(User, Members),
    makeSystem(Name, Date, Members, User, InitialChatbotCodeLink, Chatbots, NewSystem).
systemLogin(System, User, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    isLogedUser(System, ConectedUser),
    pertenece(User, Members),
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).
systemLogin(System, User, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    \+ isLogedUser(System, ConectedUser),
    \+ pertenece(User, Members),
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).

systemLogout(System, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    isLogedUser(System, ConectedUser),
    makeSystem(Name, Date, Members, [], InitialChatbotCodeLink, Chatbots, NewSystem).
systemLogout(System, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    \+ isLogedUser(System, ConectedUser),
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).


