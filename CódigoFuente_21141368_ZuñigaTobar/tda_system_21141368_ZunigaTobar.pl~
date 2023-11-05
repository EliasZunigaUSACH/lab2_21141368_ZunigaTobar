% PARADIGMAS DE PROGRAMACIÓN LABORATORIO 2
% Nombre: Elías Zúñiga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA SYSTEM

:- module(tda_system_21141368_ZunigaTobar, [putDateTime/1, agregarChatbotSinDuplicados/3, makeSystem/7, makeSystem/7, agregarChatbot/3, system/4, systemAddChatbot/3, getMembersIds/3, registerUser/3, systemAddUser/3, isLogedUser/2, systemLogin/3, systemLogout/2]).
:- use_module(tda_option_21141368_ZunigaTobar).
:- use_module(tda_flow_21141368_ZunigaTobar).
:- use_module(tda_chatbot_21141368_ZunigaTobar).
:- use_module(tda_user_21141368_ZunigaTobar).
:- use_module(tda_chatHistory_21141368_ZunigaTobar).

putDateTime(DateTime):-
    get_time(Time),
    stamp_date_time(Time, Date, 'UTC'),
    format_time(atom(DateTime), "%T %d-%m-%y", Date).

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

makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, [Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots]).

agregarChatbot(NewChatbot, Chatbots, [NewChatbot|Chatbots]).

system(Name, InitialChatbotCodeLink, Chatbots, System):-
    putDateTime(Date),
    agregarChatbotSinDuplicados(Chatbots, [], ChatbotsFiltrados),
    makeSystem(Name, Date, [], [], InitialChatbotCodeLink, ChatbotsFiltrados, System).

systemAddChatbot(System, NewChatbot, NewSystem):-
    makeSystem(Name, Date, Members, LogedUser, InitialChatbotCodeLink, Chatbots, System),
    agregarChatbot(NewChatbot, Chatbots, UpgradedChatbots),
    agregarChatbotSinDuplicados(UpgradedChatbots, [], ChatbotsFiltrados),
    makeSystem(Name, Date, Members, LogedUser, InitialChatbotCodeLink, ChatbotsFiltrados, NewSystem).

getSystemMembers([], Members, Members):- !.
getSystemMembers([User|RestoMembers], MembersAcc, MembersOut):-
    makeUser(UserName, _, User),
    getSystemMembers(RestoMembers, [UserName|MembersAcc], MembersOut).

getMembersIds([], Ids, Ids):- !.
getMembersIds([User|Members], Ids, IdsOut):-
    getUserId(User, Id),
    getMembersIds(Members, [Id|Ids], IdsOut).

registerUser(UserName, Members, [User|Members]):-
    user(UserName, [], User).

systemAddUser(System, User, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    string_lower(User, UserMin),
    getUserId(UserMin, Id),
    getSystemMembers(Members, [], MembersNames),
    getMembersIds(MembersNames, [], Ids),
    noPertenece(Id, Ids),
    registerUser(UserMin, Members, UpdatedMembers),
    makeSystem(Name, Date, UpdatedMembers, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).
systemAddUser(System, User, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    string_lower(User, UserMin),
    getUserId(UserMin, Id),
    getSystemMembers(Members, [], MembersNames),
    getMembersIds(MembersNames, [], Ids),
    pertenece(Id, Ids),
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).

isLogedUser(System, ConectedUser):-
    makeSystem(_, _, _, ConectedUser, _, _, System),
    \+ length(ConectedUser, 0).

systemLogin(System, UserName, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    \+ isLogedUser(System, ConectedUser),
    getSystemMembers(Members, [], MembersNames),
    pertenece(UserName, MembersNames),
    makeUser(UserName, _, User),
    makeSystem(Name, Date, Members, User, InitialChatbotCodeLink, Chatbots, NewSystem).
systemLogin(System, _, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    isLogedUser(System, ConectedUser),
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).
systemLogin(System, UserName, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    \+ isLogedUser(System, ConectedUser),
    getSystemMembers(Members, [], MembersNames),
    noPertenece(UserName, MembersNames),
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).

systemLogout(System, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    isLogedUser(System, ConectedUser),
    makeSystem(Name, Date, Members, [], InitialChatbotCodeLink, Chatbots, NewSystem).
systemLogout(System, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    \+ isLogedUser(System, ConectedUser),
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).

systemTalkRec(System, Message, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    isLogedUser(System, ConectedUser),
    makeUser(UserName, History, ConectedUser),
    recMessage(Message, History, UpdatedHistory),
    user(UserName, UpdatedHistory, UpdatedConectedUser),
    makeSystem(Name, Date, Members, UpdatedConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).
systemTalkRec(System, _, NewSystem):-
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    \+ isLogedUser(System, ConectedUser),
    makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).
