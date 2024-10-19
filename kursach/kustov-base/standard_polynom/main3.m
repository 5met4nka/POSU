clear, clc;
global A B K a11 a12 a21 a22 b11 b21 delta_v deg_yaw x Tpp

% Исходные данные
v0 = 5.65;
L = 51;
r21 = -0.59;
r31 = 5.32;
q21 = 0.94;
q31 = -2.41;
s21 = -0.29;
s31 = -3.4;

% Расчет параметров модели
Omega = v0 / L
a11 = -r31 * Omega
a12 = -q31 * Omega ^ 2
a21 = -r21
a22 = -q21 * Omega
b11 = -s31 * Omega ^ 2
b21 = -s21 * Omega

A = [a11 a12 0; a21 a22 0; 1 0 0]
B = [b11; b21; 0]
delta_v = deg2rad(35);
deg_yaw = deg2rad(10);

% fminsearch
w0_initial = 0.4
w0_opt = fminsearch('costfunc3', w0_initial)
Tpp
err = x(end, :)
