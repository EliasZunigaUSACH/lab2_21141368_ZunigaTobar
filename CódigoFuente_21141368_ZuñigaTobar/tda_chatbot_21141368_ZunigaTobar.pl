% PARADIGMAS DE PROGRAMACI�N LABORATORIO 2
% Nombre: El�as Z��iga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% TDA CHATBOT

:- module(tda_chatbot_21141368_ZunigaTobar, [getChatbotId/2, getChatbotsIds/3, detectorFlowsDuplicados/3, chatbot/6, chatbotAddFlow/3]).
:- use_module(tda_flow_21141368_ZunigaTobar).

% Regla: getChathotId
% Dominios: Chatbot (Lista) X Id (N�mero)
% Meta Principal: getChatbotId
% Meta Secundaria: Ninguna
% Descripci�n: Predicado selector que obtiene la id de un chatbot
getChatbotId([Id|_], Id).

% Regla: getChathotsIds
% Dominios: Chatbots (Lista) X IdsAcc (Lista) X IdsSalida (Lista)
% Meta Principal: getChatbotsIds
% Meta Secundaria: getChatbotId(ChatbotHead, Id)
% Descripci�n: Predicado selector que obtiene la ids de un grupo
%              de chatbots
getChatbotsIds([], IdsAcc, IdsAcc):- !.
getChatbotsIds([ChatbotHead|RestoChatbots], IdsAcc, IdsSalida):-
    getChatbotId(ChatbotHead, Id),
    getChatbotsIds(RestoChatbots, [Id|IdsAcc], IdsSalida).

% Regla: filtroFlows
% Dominios: Flows (Lista) X FlowsAcc (Lista) X FlowsSalida(Lista)
% Meta Principal: agregarFlows
% Meta Secundaria: getFlowId(FlowAgregar, Id), getFlowsIds(FlowsAcc, [],
%                  Ids), not(member(Id, Ids))
% Descripci�n: Predicado agrega los chatbots no repetidos
detectorFlowsDuplicados([], FlowsAcc, FlowsAcc):- !.
detectorFlowsDuplicados([FlowAgregar|RestoFlows], FlowsAcc, FlowsSalida):-
    getFlowId(FlowAgregar, Id),
    getFlowsIds(FlowsAcc, [], Ids),
    not(member(Id, Ids)),
    detectorFlowsDuplicados(RestoFlows, [FlowAgregar|FlowsAcc], FlowsSalida).

% Regla: chatbot
% Dominios: Id (N�mero) X Name (String) X WelcomeMsg (String) X
%           StartFlowID (N�mero) X Flows (Lista) X System
% Meta Principal: chatbot
% Meta Secundaria: detectorFlowsDuplicados(Flows, [], FlowsFiltrados)
% Descripci�n: Predicado constructor de un chatbot.
chatbot(Id, Name, WelcomeMsg, StartFlowID, Flows,[Id, Name, WelcomeMsg, StartFlowID, FlowsFiltrados]):-
   detectorFlowsDuplicados(Flows, [], FlowsFiltrados).

% Regla: chatbotAddFlow
% Dominios: Chatbot X Flow X Chatbot
% Meta Principal: chatbotAddFlow
% Meta Secundaria: chatbot(Id, Name, WelcomeMsg, StartFlowID, [NewFlow|Flows], NewChatbot)
% Descripci�n: Predicado modificador para a�adir flujos a un chatbot.
chatbotAddFlow([Id, Name, WelcomeMsg, StartFlowID, Flows], NewFlow, NewChatbot):-
    chatbot(Id, Name, WelcomeMsg, StartFlowID, [NewFlow|Flows], NewChatbot).
