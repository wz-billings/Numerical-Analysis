%{
 MATH 441 Homework 4, problem 4.
 Zane Billings
 Created 2019-09-22
 MATLAB/Octave script for the fourth homework, problem 4 in MATH 441, Fall 2019.
 Using Muller's method to identify all roots for a given polynomial.
%}

clear all; close all; clc; format long;

% Define the function to use. Don't know the actual value of roots. But,
% only one of the roots is real, the other two are complex conjugates.
f = @(x) (x^3 - x - 1);
tol = 10^(-6);

% Try to find real root >1.
s1 = 1.5;
s2 = 1.75;
s3 = 2.0;
[r1, i1, e1, x1] = muller_method(s1, s2, s3, tol, f);

% Try to find one of the complex roots. Once we find one, we know the
% other.
s1 = 0;
s2 = 0.25;
s3 = 0.5;
[r2, i2, e2, x2] = muller_method(s1, s2, s3, tol, f);

% Calculate the third root, which is the complex conjugate of the second
% root.
r3 = conj(r2);

fprintf("The three roots of f(x) are: %g, %g + %gi, and %g - %gi.", ...
r1, real(r2), imag(r2), real(r3), imag(r3))
