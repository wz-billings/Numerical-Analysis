%{
 MATH 441: Secant Method
 Zane Billings
 Created 19 September, 2019
 % This function uses the secant method to find a root of the function f,
 % starting from the seed. The solution converges to the root with maximal
 % error equal to the value of tol.
%}
function [root,iterations] = secant_method(seed1, seed2, tol, f)
  % Define all needed variables.
  % The two seeds are set as the first two entries in a vector of outputs.
  x(1) = seed1;
  x(2) = seed2;

  % Error is initialized to 1 for the purposes of the while loop. If your
  %  tolerance is 1 you weren't going to get a good answer anyway.
  error(1) = 1;

  % Initilize "loop variable" to count loop iterations. Only used for counting,
  %  not for loop design.
  i = 1;

  while(error > tol)
    % Calculate the secant method approximation.
    last_part = ((x(i + 1) - x(i)) / (f(x(i + 1)) - f(x(i))));
    x(i + 2) = x(i + 1) - f(x(i + 1)) * last_part;

    % If this is the true root value, quit.
    if (f(x(i + 2)) == 0)
      break
    end

    % Calculate approximate error, but will not work on the first run.
    if (i > 1)
      error(i) = abs(x(i + 2) - x(i - 1));
    end

    % Update counter.
    i = i + 1;
  end

  root = x(i + 1);
  iterations = i + 1;
end
