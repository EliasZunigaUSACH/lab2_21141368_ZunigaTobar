% PARADIGMAS DE PROGRAMACIÓN LABORATORIO 2
% Nombre: Elías Zúñiga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA SYSTEM

:- module(tda_system_21141368_ZunigaTobar, [putDateTime/1, agregarChatbotSinDuplicados/3, makeSystem/6, makeSystem/7, agregarChatbot/3, system/4, systemAddChatbot/3, getSystemName/2, getSystemMembers/2, getSystemChatbots/2, getMembersIds/3, registerUser/3, systemAddUser/3, isLogedUser/2, systemLogin/3, systemLogout/2]).
:- use_module(tda_option_21141368_ZunigaTobar).
:- use_module(tda_flow_21141368_ZunigaTobar).
:- use_module(tda_chatbot_21141368_ZunigaTobar).
:- use_module(tda_user_21141368_ZunigaTobar).

putDateTime(DateTime):-
    get_time(Time),
    stamp_date_time(Time, Date, local),
    format_time(atom(DateTime), "%T %d-%M-%Y", Date).

agregarChatbotSinDuplicados([], ChatbotsAcc, ChatbotsAcc):- !.
agregarChatbotSinDuplicados([ChatbotAgregar|RestoChatbots], ChatbotsAcc, ChatbotsSalida):-
    getChatbotId(ChatbotAgregar, Id),
    getChatbotsIds(ChatbotsAcc, [], Ids),
    noPertenece(Id, Ids),
    agregarChatbotSinDuplicados(RestoChatbots, [ChatbotAgregar|ChatbotsAcc], ChatbotsSalida).
agregarChatbotSinDuplicados([ChatbotAgregar|RestoChatbots], ChatbotsAcc, ChatbotsSalida):-
    getChatbotId(ChatbotAgregar, Id),
    getChatbotsIds(ChatbotsAcc, [], Ids),
    pertenece(Id, Ids),
    agregarChatbotSinDuplicados(RestoChatbots, ChatbotsAcc, ChatbotsSalida).

makeSystem(Name, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, [Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots]):-
    putDateTime(Date).

makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, [Name, Date, Members, ConectedUser, InitialChatbotCodeLink, ChatbotsFiltrados]):-
    agregarChatbotSinDuplicados(Chatbots, [], ChatbotsFiltrados).

agregarChatbot(NewChatbot, Chatbots, [NewChatbot|Chatbots]).

system(Name, InitialChatbotCodeLink, Chatbots, System):-
    makeSystem(Name, [], [], InitialChatbotCodeLink, Chatbots, System).

systemAddChatbot(System, NewChatbot, NewSystem):-
    makeSystem(Name, Date, Members, LogedUser, InitialChatbotCodeLink, Chatbots, System),
    agregarChatbot(NewChatbot, Chatbots, UpgradedChatbots),
    makeSystem(Name, Date, Members, LogedUser, InitialChatbotCodeLink, UpgradedChatbots, NewSystem).

getSystemName(System, Name):-
    makeSystem(Name, _, _, _, _, _, System).

getSystemMembers(System, Members):-
    makeSystem(_, _, Members, _, _, _, System).

getSystemChatbots(System, Chatbots):-
    makeSystem(_, _, _, _, _, Chatbots, System).

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


recMessage(User, Message):-
    user().

systemTalkRec(System, Message, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    isLogedUser(System, ConectedUser),
    .
systemTalkRec(System, _, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    \+ isLogedUser(System, ConectedUser),
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).

