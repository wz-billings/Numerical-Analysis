%{
 MATH 441: Bisection Method
 Zane Billings
 Created 19 September, 2019
 % This function uses the bisection method to find a root of the function f,
 % within the interval [a,b]. The solution converges to the root with maximal
 % error equal to the value of tol.
%}
function [root,iterations] = bisection_method(a,b,tol,f)
  % Define all needed variables. I don't want to write over the inputs, so the
  %  input parameters a, b are specified to be new variables.
  a_n = a;
  b_n = b;

  % Error is initialized to 1 for the purposes of the while loop. If your
  %  tolerance is 1 you weren't going to get a good answer anyway.
  error(1) = 1;

  % Initilize "loop variable" to count loop iterations. Only used for counting,
  %  not for loop design.
  i = 1;

  while(error > tol)
    % Initialize the midpoint.
    p(i) = (a_n + b_n)/2;

    % If this is the true root value, quit.
    if (f(p(i)) == 0)
      break
    end

    % Update the midpoints using the condition of the Intermediate Value Thm.
    if (f(a_n)*f(p(i)) < 0)
      b_n = p(i);
    else
      a_n = p(i);
    end

    % Calculate approximate error, but will not work on the first run.
    if (i > 1)
      error(i) = abs(p(i) - p(i - 1));
    end

    % Update counter.
    i = i + 1;
  end

  root = p(i - 1);
  iterations = i - 1;
end
