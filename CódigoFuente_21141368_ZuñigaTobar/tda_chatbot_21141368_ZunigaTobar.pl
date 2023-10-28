% PARADIGMAS DE PROGRAMACIÓN LABORATORIO 2
% Nombre: Elías Zúñiga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA CHATBOT

:- module(tda_chatbot_21141368_ZunigaTobar, [getChatbotId/2, getChatbotsIds/3, agregarFlowsSinDuplicados/3, chatbot/6, chatbotAddFlow/3, agregarFlow/3]).
% :- use_module(tda_option_21141368_ZunigaTobar).
:- use_module(tda_flow_21141368_ZunigaTobar).

getChatbotId(Chatbot, Id):-
    chatbot(Id, _, _, _, _, Chatbot).

getChatbotsIds([ChatbotHead|RestoChatbots], IdsAcc, IdsSalida):-
    getChatbotId(ChatbotHead, Id),
    getChatbotsIds(RestoChatbots, [Id|IdsAcc], IdsSalida).

agregarFlowsSinDuplicados([], FlowsAcc, FlowsAcc):- !.
agregarFlowsSinDuplicados([FlowAgregar|RestoFlows], FlowsAcc, FlowsSalida):-
    getFlowId(FlowAgregar, Id),
    getFlowsIds(FlowsAcc, [], Ids),
    noPertenece(Id, Ids),
    agregarFlowsSinDuplicados(RestoFlows, [FlowAgregar|FlowsAcc], FlowsSalida).
agregarFlowsSinDuplicados([FlowAgregar|RestoFlows], FlowsAcc, FlowsSalida):-
    getFlowId(FlowAgregar, Id),
    getFlowsIds(FlowsAcc, [], Ids),
    pertenece(Id, Ids),
    agregarFlowsSinDuplicados(RestoFlows, FlowsAcc, FlowsSalida).

agregarFlow(NewFlow, Flows, [NewFlow|Flows]).

chatbot(Id, Name, WelcomeMsg, StartFlowID, Flows, [Id, Name, WelcomeMsg, StartFlowID, FlowsFiltrados]):-
    agregarFlowsSinDuplicados(Flows, [], FlowsFiltrados).

chatbotAddFlow(Chatbot, NewFlow, NewChatbot):-
    chatbot(Id, Name, WelcomeMsg, StartFlowID, Flows, Chatbot),
    agregarFlow(NewFlow, Flows, NewFlows),
    chatbot(Id, Name, WelcomeMsg, StartFlowID, NewFlows, NewChatbot).
