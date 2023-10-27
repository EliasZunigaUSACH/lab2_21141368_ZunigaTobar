% PARADIGMAS DE PROGRAMACI�N LABORATORIO 2
% Nombre: El�as Z��iga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA SYSTEM


:- use_module(tda_flow_21141368_ZunigaTobar).
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

getSystemMembers(System, Members):-
    makeSystem(_, _, Members, _, _, System).

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
    nopertenece(Id, Ids),
    registerUser(UserMin, Members, UpdatedMembers),
    makeSystem(Name, Date, UpdatedMembers, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).
systemAddUser(System, User, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    user(User, UserMin),
    getUserId(UserMin, Id),
    getMembersIds(Members, [], Ids),
    pertenece(Id, Ids),
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).


systemLogedUser(System, ConectedUser):-
    makeSystem(_, _, Members, ConectedUser, _, _, System),
    pertenece(ConectedUser, Members).

systemLogin(System, User, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    \+ systemLogedUser(System, ConectedUser),
    makeSystem(Name, Date, Members, User, InitialChatbotCodeLink, Chatbots, NewSystem).
systemLogin(System, User, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    systemLogedUser(System, ConectedUser),
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).

systemLogout(System, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    systemLogedUser(System, ConectedUser),
    makeSystem(Name, Date, Members, [], InitialChatbotCodeLink, Chatbots, NewSystem).
systemLogout(System, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    \+ systemLogedUser(System, ConectedUser),
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).

