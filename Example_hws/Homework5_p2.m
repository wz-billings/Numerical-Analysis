%{
 MATH 441: Homework 5, Problem 2
 Zane Billings
 Created 23 September, 2019
 Computing the computational order of convergence for three difference
 functional iteration methods.
%}

clear all; close all; clc; format long;

tolerance = 10^(-6);
f = @(x) (x^4 - 5*x^3 + 2*x^2 + 7*x - 5);
d1 = @(x) (4*x^3 - 15*x^2 + 4*x + 7);
d2 = @(x) (12*x^2 - 30*x + 4);

% Method one:
% Method one iteration calculation:
x(1) = 4;
n = 1;
error1(1) = 1;

while ( error1(n) > tolerance )
   % Compute next iterate 
   x(n + 1) = x(n) - f(x(n))/d1(x(n)) - (d2(x(n))/(2*d1(x(n)))) * ...
       (f(x(n))/d1(x(n)))^2;
   
   % Compute error
   error1(n + 1) = abs(x(n + 1) - x(n));
   
   % Update counter
   n = n + 1;
end

% Method one computational order of convergence
i = 2;
while (i < length(x))
    rho1(i - 1) = log(abs(x(i + 1) - x(i)))/log(abs(x(i) - x(i - 1)));
    i = i + 1;
end

% Method two:
% Method two iteration calculation:
y(1) = 4;
z(1) = 5;
n = 1;
error2(1) = 1;

while ( error2(n) > tolerance )
   % Compute next iterate 
   y(n) = z(n) - f(z(n))/d1(z(n));
   z(n + 1) = z(n) - f(z(n))/d1(0.5*(y(n) + z(n)));
   
   % Compute error
   error2(n + 1) = abs(z(n + 1) - z(n));
   
   % Update counter
   n = n + 1;
end

% Method one computational order of convergence
i = 2;
while (i < length(z))
    rho2(i - 1) = log(abs(z(i + 1) - z(i)))/log(abs(z(i) - z(i - 1)));
    i = i + 1;
end
