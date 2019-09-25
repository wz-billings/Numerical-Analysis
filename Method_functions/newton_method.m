%{
 MATH 441: Newton's Method
 Zane Billings
 Created 19 September, 2019
 % This function uses Newton's method to find a root of the function f,
 % starting from the seed. The solution converges to the root with maximal
 % error equal to the value of tol.
%}
function [root, iterations, error, x] = newton_method(seed,tol,f,d)
  % Define all needed variables.
  % The seed is set as the first entry in a vector of outputs.
  x(1) = seed;

  % Error is initialized to 1 for the purposes of the while loop. If your
  %  tolerance is 1 you weren't going to get a good answer anyway.
  error(1) = 1;

  % Initilize "loop variable" to count loop iterations. Only used for counting,
  %  not for loop design.
  i = 1;

  while(error > tol)
    % Calculate the Newton's method approximation
    x(i + 1) = x(i) - f(x(i))/d(x(i));

    % If this is the true root value, quit.
    if (f(x(i + 1)) == 0)
      break
    end

    % Calculate approximate error, but will not work on the first run.
    if (i > 1)
      error(i) = abs(x(i + 1) - x(i));
    end

    % Update counter.
    i = i + 1;
  end

  root = x(i);
  iterations = i;
end
