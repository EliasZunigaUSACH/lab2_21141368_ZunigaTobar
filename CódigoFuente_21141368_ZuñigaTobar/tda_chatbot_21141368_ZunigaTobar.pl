% PARADIGMAS DE PROGRAMACIÓN LABORATORIO 2
% Nombre: Elías Zúñiga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA CHATBOT

:- module(tda_chatbot_21141368_ZunigaTobar, [getChatbotId/2, getChatbotsIds/3, filtroFlowsDuplicados/3, chatbot/6, chatbotAddFlow/3]).
:- use_module(tda_flow_21141368_ZunigaTobar).

getChatbotId([Id|_], Id).

getChatbotsIds([], IdsAcc, IdsAcc):- !.
getChatbotsIds([ChatbotHead|RestoChatbots], IdsAcc, IdsSalida):-
    getChatbotId(ChatbotHead, Id),
    getChatbotsIds(RestoChatbots, [Id|IdsAcc], IdsSalida).

filtroFlowsDuplicados([], FlowsAcc, FlowsAcc):- !.
filtroFlowsDuplicados([FlowAgregar|RestoFlows], FlowsAcc, FlowsSalida):-
    getFlowId(FlowAgregar, Id),
    getFlowsIds(FlowsAcc, [], Ids),
%    noPertenece(Id, Ids),
    not(member(Id, Ids)),
    filtroFlowsDuplicados(RestoFlows, [FlowAgregar|FlowsAcc], FlowsSalida).
filtroFlowsDuplicados([FlowAgregar|RestoFlows], FlowsAcc, FlowsSalida):-
    getFlowId(FlowAgregar, Id),
    getFlowsIds(FlowsAcc, [], Ids),
%    pertenece(Id, Ids),
    member(Id, Ids),
    filtroFlowsDuplicados(RestoFlows, FlowsAcc, FlowsSalida).

chatbot(Id, Name, WelcomeMsg, StartFlowID, Flows,[Id, Name, WelcomeMsg, StartFlowID, FlowsFiltrados]):-
   filtroFlowsDuplicados(Flows, [], FlowsFiltrados).

chatbotAddFlow([Id, Name, WelcomeMsg, StartFlowID, Flows], NewFlow, NewChatbot):-
    chatbot(Id, Name, WelcomeMsg, StartFlowID, [NewFlow|Flows], NewChatbot).
