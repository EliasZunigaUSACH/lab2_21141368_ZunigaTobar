% PARADIGMAS DE PROGRAMACI�N LABORATORIO 2
% Nombre: El�as Z��iga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA SYSTEM

putDateTime(DateTime):-
    get_time(Time),
    stamp_date_time(Time, Date, local),
    format_time(atom(DateTime), "%T %d-%M-%Y", Date).

makeSystem(Name, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, [Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots]):-
    putDateTime(Date).

makeSystem(Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots, [Name, Date, Members, ConectedUser, InitialChatbotCodeLink, Chatbots]).

system(Name, InitialChatbotCodeLink, Chatbots, System):-
    makeSystem(Name, [], [], InitialChatbotCodeLink, Chatbots, System).
