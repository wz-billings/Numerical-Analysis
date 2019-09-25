%{
 MATH 441 Homework 4, problem 3.
 Zane Billings
 Created 2019-09-19
 MATLAB/Octave script for the fourth homework, problem 3 in MATH 441, Fall 2019.
 Find the approximation to the root -1 of f with multiplicity 3.
%}

clear all; close all; clc; format long;

x_naught = [-3:0.1:2];
mult = [1, 2, 3, 4, 5, 6, 7];
f = @(x) (x^6 + 5*x^5 + 4*x^4 - 14*x^3 - 31*x^2 - 23*x - 6);
d = @(x) (6*x^5 + 25*x^4 + 16*x^3 - 3*14*x^2 - 2*31*x - 23);
i = 1;
errorsm = eye(1);

for m = mult
    [r(m), it(m)] = ...
        newton_method_m1(-0.5, 10^(-6), f, d, m);
end

% Make a 2D plot of iterations vs. multiplicities
figure
plot(mult,it)
title("Number of iterations vs. assumed multiplicities of the root")
xlabel("Assumed multiplicty, m, for modified Newton method")
ylabel("Number of iterations to convergence")

for s = x_naught
    [a(i), b(i)] = ...
    newton_method_m1(s, 10^(-6), f, d, 4);
i = i + 1;
end

% Make a 2D plot of seeds vs. multiplicities
figure
plot(x_naught,b)
title("Number of iterations vs. starting seed values")
xlabel("Initial seed for Newton method")
ylabel("Number of iterations to convergence")

