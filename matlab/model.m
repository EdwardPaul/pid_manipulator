clear all;
close all;
clc;

%% Задание системы
s = tf('s'); % Ввод передаточной функции (transer function)
H = 18 / (42s^2); %Передаточная функция
G1 = ss(H); 

%% Проверка наблюдаемости и управляемости системы
check_kalman(G1); 


%% Вывод графика полюсов системы
param.fileName = strcat('poles_',datestr(datetime('now'),'yyyy-mm-dd_HH-MM-SS'));

param.fileFormat = "pdf"; 
param.pictUnit = 'centimeters';
param.pictSize = [10 10]; 
param.tickFontsize = 10;  
param.mainFontsize = 16; 
param.MarkerSize = 25;

print_poles(G1, param)

%% Вывод графиков из Simulink модели
open('manipulator.slx');

sim_data = sim('manipulator.slx');


param.fileName = strcat('sim_', datestr(datetime('now'),'yyyy-mm-dd_HH-MM-SS'));

param.pictUnit = 'centimeters'; 
param.pictSize = [20 20]; 
param.tickFontsize = 10; 
param.mainFontsize = 16; 
param.LineWidth = 2;
param.Ylabel = '$U_a$, V';

print_sim(sim_data.tout,[sim_data.Y_step.data, sim_data.Yref.data],param)