% PARADIGMAS DE PROGRAMACIÓN LABORATORIO 2
% Nombre: Elías Zúñiga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA SYSTEM

:- module(tda_system_21141368_ZunigaTobar, [putDateTime/1, filtroChatbotDuplicados/3, system/4, system/7, systemAddChatbot/3, getMembersIds/3, registerUser/3, systemAddUser/3, isLogedUser/2, systemLogin/3, systemLogout/2]).
:- use_module(tda_chatbot_21141368_ZunigaTobar).
:- use_module(tda_user_21141368_ZunigaTobar).
:- use_module(tda_chatHistory_21141368_ZunigaTobar).

putDateTime(DateTime):-
    get_time(Time),
    stamp_date_time(Time, Date, 'UTC'),
    format_time(atom(DateTime), "%T %d-%m-%y", Date).

filtroChatbotDuplicados([], ChatbotsAcc, ChatbotsAcc):- !.
filtroChatbotDuplicados([ChatbotAgregar|RestoChatbots], ChatbotsAcc, ChatbotsSalida):-
    getChatbotId(ChatbotAgregar, Id),
    getChatbotsIds(ChatbotsAcc, [], Ids),
    not(member(Id, Ids)),
    filtroChatbotDuplicados(RestoChatbots, [ChatbotAgregar|ChatbotsAcc], ChatbotsSalida).
filtroChatbotDuplicados([ChatbotAgregar|RestoChatbots], ChatbotsAcc, ChatbotsSalida):-
    getChatbotId(ChatbotAgregar, Id),
    getChatbotsIds(ChatbotsAcc, [], Ids),
    member(Id, Ids),
    filtroChatbotDuplicados(RestoChatbots, ChatbotsAcc, ChatbotsSalida).

system(Name, InitialChatbotCodeLink, Chatbots, [Name, Date, [], [], InitialChatbotCodeLink, ChatbotsFiltrados]):-
    putDateTime(Date),
    filtroChatbotDuplicados(Chatbots, [], ChatbotsFiltrados).
system(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, [Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots]).

systemAddChatbot(System, NewChatbot, NewSystem):-
    system(Name, Date, Members, LogedUser, InitialChatbotCodeLink, Chatbots, System),
    filtroChatbotDuplicados([NewChatbot|Chatbots], [], ChatbotsFiltrados),
    system(Name, Date, Members, LogedUser, InitialChatbotCodeLink, ChatbotsFiltrados, NewSystem).

getSystemMembers([], Members, Members):- !.
getSystemMembers([User|RestoMembers], MembersAcc, MembersOut):-
    getUserName(User, UserName),
    getSystemMembers(RestoMembers, [UserName|MembersAcc], MembersOut).

getMembersIds([], Ids, Ids):- !.
getMembersIds([User|Members], Ids, IdsOut):-
    getUserId(User, Id),
    getMembersIds(Members, [Id|Ids], IdsOut).

registerUser(UserName, Members, [User|Members]):-
    user(UserName, [], User).

systemAddUser(System, User, NewSystem):-
    system(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    string_lower(User, UserMin),
    getUserId(UserMin, Id),
    getSystemMembers(Members, [], MembersNames),
    getMembersIds(MembersNames, [], Ids),
    not(member(Id, Ids)),
    registerUser(User, Members, UpdatedMembers),
    system(Name, Date, UpdatedMembers, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).
systemAddUser(System, User, NewSystem):-
    system(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    string_lower(User, UserMin),
    getUserId(UserMin, Id),
    getSystemMembers(Members, [], MembersNames),
    getMembersIds(MembersNames, [], Ids),
    member(Id, Ids),
    system(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).

isLogedUser(System, ConectedUser):-
    system(_, _, _, ConectedUser, _, _, System),
    \+ length(ConectedUser, 0).

getMembersUser(Name, [User|RestoUsers], UserOut):-
    not(member(Name, User)),
    getMembersUser(Name, RestoUsers, UserOut).
getMembersUser(Name, [User|_], User):-
    member(Name, User).

systemLogin(System, User, NewSystem):-
    string_lower(User, UserMin),
    system(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    \+ isLogedUser(System, ConectedUser),
    getSystemMembers(Members, [], MembersNames),
    member(UserMin, MembersNames),
    getMembersUser(UserMin, Members, UserToConect),
    system(Name, Date, Members, UserToConect, InitialChatbotCodeLink, Chatbots, NewSystem).
systemLogin(System, _, NewSystem):-
    system(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    isLogedUser(System, ConectedUser),
    system(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).
systemLogin(System, UserName, NewSystem):-
    system(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    \+ isLogedUser(System, ConectedUser),
    getSystemMembers(Members, [], MembersNames),
    not(member(UserName, MembersNames)),
    system(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).

systemLogout(System, NewSystem):-
    system(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    isLogedUser(System, ConectedUser),
    system(Name, Date, Members, [], InitialChatbotCodeLink, Chatbots, NewSystem).
systemLogout(System, NewSystem):-
    system(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    \+ isLogedUser(System, ConectedUser),
    system(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).

systemTalkRec(System, Message, NewSystem):-
    system(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    isLogedUser(System, ConectedUser),
    getUserName(ConectedUser, UserName),
    getUserHistory(ConectedUser, History),
    recMessage(Message, History, UpdatedHistory),
    user(UserName, UpdatedHistory, UpdatedConectedUser),
    system(Name, Date, Members, UpdatedConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).
systemTalkRec(System, _, NewSystem):-
    system(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, System),
    \+ isLogedUser(System, ConectedUser),
    system(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, NewSystem).

myRandom(Xn, Xn1):-
	Xn1 is ((1103515245 * Xn) + 12345) mod 2147483648.
