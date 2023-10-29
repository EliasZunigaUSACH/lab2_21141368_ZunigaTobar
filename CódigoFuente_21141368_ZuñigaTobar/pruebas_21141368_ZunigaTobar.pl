% PARADIGMAS DE PROGRAMACIÓN LABORATORIO 2
% Nombre: Elías Zúñiga Tobar
% RUT: 21.141.368-9
% Profesor Gonzalo Matrinez
% SCRIPT DE PRUEBAS

:- use_module(tda_system_21141368_ZunigaTobar).
:- use_module(tda_option_21141368_ZunigaTobar).
:- use_module(tda_flow_21141368_ZunigaTobar).
:- use_module(tda_chatbot_21141368_ZunigaTobar).
:- use_module(tda_user_21141368_ZunigaTobar).

option(1, "1 - viajar", 2, 4, ["viajar", "turistear", "conocer"], O1).
option(2, "2 - estudiar", 4, 3, ["aprender", "perfeccionarme"], O2).
flow(1, "Flujo 1: mensaje de prueba", [ ], F1).
flow(1, "Flujo 1: mensaje de prueba", [O1, O2], F2).
flowAddOption(F1, O1, F11).
flowAddOption(F2, O1, F21).
chatbot(0, "Asistente", "Bienvenido ¿Qué quieres hacer?", 1, [F11], CB1).

