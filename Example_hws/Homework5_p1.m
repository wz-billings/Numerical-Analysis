%{
 MATH 441: Homework 5, Problem 1
 Zane Billings
 Created 23 September, 2019
 Using Newton's Method to calculate the three roots of a polynomial. Then
 we can use the convergence (error) data to determine which root has
 multiplicity.
%}
clear all; close all; clc; format long;

f = @(x) (x^4 - 5*x^3 + 2*x^2 + 7*x - 5);
d = @(x) (4*x^3 - 15*x^2 + 4*x + 7);
t = 10^(-6);

s1 = -2;
[r1, i1, e1, x1] = newton_method(s1, t, f, d);

s2 = 0;
[r2, i2, e2, x2] = newton_method(s2, t, f, d);

s3 = 4;
[r3, i3, e3, x3] = newton_method(s3, t, f, d);

fprintf("First root is %f (%g iterations),\nsecond root is %f (%g iterations),\nthirdroot is %f (%g iterations)\n", r1, i1, r2, i2, r3, i3)