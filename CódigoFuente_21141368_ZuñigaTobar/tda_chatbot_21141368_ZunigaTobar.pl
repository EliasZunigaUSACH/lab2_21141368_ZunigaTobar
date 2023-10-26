% PARADIGMAS DE PROGRAMACI�N LABORATORIO 2
% Nombre: El�as Z��iga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA CHATBOT

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

chatbot(Id, Name, WelcomeMsg, StartFlowID, Flows, [Id, Name, WelcomeMsg, StartFlowID, FlowsFiltrados]):-
    agregarFlowsSinDuplicados(Flows, [], FlowsFiltrados).
