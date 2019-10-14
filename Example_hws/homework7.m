%{
  % Zane Billings
  % Homework 7 Script
  % 2019-10-08
%}

clear all; close all; clc; format long;

% Problem 2
x2 = [0, 10, 20, 30, 40, 50];
y2 = [151326, 179323, 203302, 226542, 249633, 281422];

out2 = natural_spline(x2,y2);

fprintf("The cubic spline between 1980 and 1990 is %f + %f*(x-30) + %f*(x-30)^2 + %f*(x-30)^3.\n", ...
        out2(4,1), out2(4,2), out2(4,3), out2(4,4));

f = @(x) (out2(4,1) + out2(4,2).*(x - 30) + out2(4,3).*(x - 30).^2 + out2(4,4).*(x - 30).^3);

fprintf("The interpolated value in 1985 using the cubic ...
 spline interpolant is %f.\n", f(35));

% Problem 3
p3 = linspace(-1,1);
f3 = @(x) (1 ./ (1 + 25 .* (x .^ 2)));
y3 = f3(p3);
figure();
plot(p3,y3,'-k');
title("f(x)")

x3b = -1:0.50:1;
y3b = f3(x3b);
l4 = lagrange_poly(x3b,y3b,p3);
figure();
plot(p3,y3,'-b');
hold on;
plot(p3,l4,'-r',x3b,y3b,'.');
title("f(x) vs. 4th order Lagrange polynomial")

x3c = -1:0.25:1;
y3c = f3(x3c);
l8 = lagrange_poly(x3c,y3c,p3);
figure();
plot(p3,y3,'-b');
hold on;
plot(p3,l8,'-r',x3c,y3c,'.');
title("f(x) vs. 8th order Lagrange polynomial")

% The derivative values we need are:
% f'(-1) = 0.07396
% f'(1) = -0.07396


spline3 = clamped_spline(x3c,y3c,0.07396,-0.07396);
hold on;
plot(p3,y3,'-r');
title("f(x) vs. clamped cubic spline interpolant")
close all;
% Problem 4
x4 = [0, 0, 3, 3, 5, 5, 8, 8, 13, 13];
y4 = [0, 0, 225, 225, 383, 383, 623, 623, 993, 993];
d4 = [75, 75, 77, 77, 80, 80, 74, 74, 72, 72];
p4 = linspace(min(x4),max(x4),1000);

out4 = hermite_poly(x4,y4,d4,p4);

hermite = @(x) (out4(1) + ...
     out4(2) .* ((x - 0)) + ...
     out4(3) .* ((x - 0).^2) + ... 
     out4(4) .* ((x - 0).^2 .* (x - 3)) + ...
     out4(5) .* ((x - 0).^2 .* (x - 3).^2) + ...
     out4(6) .* ((x - 0).^2 .* (x - 3).^2 .* (x - 5)) + ...
     out4(7) .* ((x - 0).^2 .* (x - 3).^2 .* (x - 5).^2) + ...
     out4(8) .* ((x - 0).^2 .* (x - 3).^2 .* (x - 5).^2 .* (x - 8)) + ...
     out4(9) .* ((x - 0).^2 .* (x - 3).^2 .* (x - 5).^2 .* (x - 8).^2) + ...
     out4(10) .* ((x - 0).^2 .* (x - 3).^2 .* (x - 5).^2 .* (x - 8).^2 .* (x - 13)));  

h4 = hermite(p4);

for i = 2:length(h4)
  hp4(i - 1) = (h4(i) - h4(i - 1)) / (p4(i) - p4(i - 1));
end

hp4(length(p4)) = 72;

p4a1 = hermite(10);
p4a2 = (hermite(10.01) - hermite(9.99)) / (0.02);

fprintf("\nH(10) is approx. %f, and H'(10) is approx. %f .\n",p4a1,p4a2);

figure();
plot(p4,h4,'r-',x4,y4,'ko');
title("Hermite polynomial approximation of f(x)")

figure();
plot(p4,hp4,'r-',x4,d4,'ko');
title("Numerical approximation of H'(x)")

close all;