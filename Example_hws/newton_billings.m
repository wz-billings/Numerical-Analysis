%{
 MATH 441 Homework 4, problem 2.
 Zane Billings
 Created 2019-09-19
 MATLAB/Octave script for the fourth homework, problem 2 in MATH 441, Fall 2019.
 Approximate the k-th root of N to a relative error of 10^-6 using
 Newton's method.

 Since we need to find a root with Newton's method, let Let g(x) = x^k - N.
 Then, the roots of g(x) are the k-th root of N.
%}

% Ask the user to input k and N.
k = input("Enter k: ");
N = input("\nEnter N: ");

% Declare the tolerance for the error calculation, and set the first entry of
%  the vector of errors to be 1.
tol = 10^(-6);
error(1) = 1;

% Initilize "loop variable" to count loop iterations. Only used for counting,
%  not for loop design.
i = 1;

% Declare the function g to find the root of, and its derivative.
g = @(x) (x^k - N);
d = @(x) (k*x^(k-1));

% Determine a guess for the seed automatically.
x(1) = k/N;

% Use Newton's method to approximate the roots of g.
while(error > tol)
  % Calculate the Newton's method approximation
  x(i + 1) = x(i) - g(x(i))/d(x(i));

  % If this is the true root value, quit.
  if (g(x(i + 1)) == 0)
    break
  end

  % Calculate relative error, but will not work on the first run.
  if (i > 1)
    error(i) = abs(x(i + 1) - x(i))/x(i);
  end

  % Update counter.
  i = i + 1;
end

fprintf("The %g root of %f converged to %f after %g iterations\n", k, N, x(i), i)
