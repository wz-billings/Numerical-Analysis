%{
% Zane Billings
% 2019-09-09
% Numerical Analysis Homework 3
%}

% Problem 1a
n_max = @(a,b) ceil( (5*log(10)+log(b-a)) / log(2) );

%% Part i
f = @(x) (2*x + 3*cos(x) - exp(x));
a = 0;
b = 2;
n = n_max(a,b);

[r, it] = bisection_method_for(a,b,n,f);
print_bisection_res("1.a.i",r,it)

%% Part ii
f = @(x) (x^2 - 4*x + 4 - log(x));
a = 1;
b = 2;
n = n_max(a,b);

[r, it] = bisection_method_for(a, b, n, f);
print_bisection_res("1.a.ii",r,it)

%% Part iii
f = @(x) (x^2 - 4*x + 4 - log(x));
a = 2;
b = 4;
n = n_max(a,b);

[r, it] = bisection_method_for(a, b, n, f);
print_bisection_res("1.a.iii",r,it)

% Problem 1b
f = @(x) ((x + 2) * (x + 1)^2 * x * (x - 1)^3 * (x - 2));

%% Part i
% The actual zeroes of the polynomial are -2, -1, -1, 0, 1, 1, 1, 2

%% Part ii -- have to write with while.
a = -1.5;
b = 2.5;
tol = 10^(-5);

[r, it] = bisection_method_while(a, b, tol, f);
print_bisection_res("1.b.ii",r,it)

%% Part iii --
a = -0.5;
b = 2.4;

[r, it] = bisection_method_while(a, b, tol, f);
print_bisection_res("1.b.iii",r,it)

%% Part iv --
a = -0.5;
b = 3;

[r, it] = bisection_method_while(a, b, tol, f);
print_bisection_res("1.b.iv", r, it)

%% Part v --
a = -3;
b = -0.5;

[r, it] = bisection_method_while(a, b, tol, f);
print_bisection_res("1.b.v", r, it)

% Question 2

%% Part b
actual = 21^(1/3);
tol = 10^(-6);
g = @(x) ((1/21)*(20*x + (21/x^2)));
root = 2.75;
i = 0;

while (abs(root - actual) > tol)
  i = i + 1;
  root = g(root);
  error = root - actual;
end

fprintf("Problem 2b:\nConverged to %f after %g iterations.\n",root,i)
