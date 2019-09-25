%{
 MATH 441 Homework 4, problem 1.
 Zane Billings
 Created 2019-09-19
 MATLAB/Octave script for the fourth homework, problem 1 in MATH 441, Fall 2019.
 Calculate the root of f(x)
%}

clear all; close all; clc; format long;

% Declare error tolerance here, since I will use the same tolerance everywhere.
tol = 10^(-6);

% Problem 1.
f = @(x) ((x-2)^2 - log(x));

% Part (a) using the Bisection Method.
a = 1;
b = 2;
[root_a, it_a] = bisection_method(a, b, tol, f);

fprintf("Bisection method converged to %f after %g iterations\n",root_a, it_a)

% Part (b) using Newton's Method.
d = @(x) (2*(x-2) - 1/x);
x_b = 1.5;
[root_b, it_b] = newton_method(x_b, tol, f, d);

fprintf("Newton method converged to %f after %g iterations\n",root_b, it_b)

% Part (c) using the secant method.
seed1 = 1.2;
seed2 = 1.7;
[root_c, it_c] = secant_method(seed1, seed2, tol, f);

fprintf("Secant method converged to %f after %g iterations\n",root_c, it_c)
