%{
 MATH 441: Muller's Method
 Zane Billings
 Created 19 September, 2019
 % This function uses Muller's method to find a root of the function f,
 % starting from the seed. The solution converges to the root with maximal
 % error equal to the value of tol.
%}
function [root, iterations, error, x] = muller_method(seed1, seed2, seed3, tol, f)
  % Define all needed variables.
  % The seed is set as the first entry in a vector of outputs.
  x(1) = seed1;
  x(2) = seed2;
  x(3) = seed3;

  % Error is initialized to 1 for the purposes of the while loop. If your
  %  tolerance is 1 you weren't going to get a good answer anyway.
  error(1) = 1;
  error(2) = 1;
  error(3) = 1;
  eps = 1;

  % Initilize "loop variable" to count loop iterations. Only used for counting,
  %  not for loop design.
  i = 1;

  while( eps > tol )
    % Calculate the next estimate using Muller's method.
    % Find the three parabola coefficients. 
    % These computations are really ugly but I didn't want to assign
    % variables and split them up.
    a = ((x(i + 1) - x(i + 2))*(f(x(i))-f(x(i+2))) - (x(i) - x(i+2)) ...
        *(f(x(i+1))-f(x(i+2)))) / ((x(i) - x(i+2))*(x(i+1)-x(i+2))*(x(i)-x(i+1)));
    b = ((x(i) - x(i+2))^2*(f(x(i+1))-f(x(i+2)))-(x(i+1)-x(i+2))^2 ... 
        * (f(x(i))-f(x(i+2)))) / ((x(i) - x(i+2))*(x(i+1)-x(i+2))*(x(i)-x(i+1)));
    c = f(x(i+2));
    d = sqrt(b^2 - 4*a*c);
    % Calculate root using quadratic formula. Choose soln based on the sign
    % of b.
    if abs(b - d) > abs(b + d)
        E = -1;
    else
        E = 1;
    end
    % Do the quadratic formula, computer form.
    x(i + 3) = x(i + 2) - (2 * c)/(b + E*d);

    % If this is the true root value, quit.
    if (f(x(i + 3)) == 0)
      break
    end

    % Calculate approximate error. I used the error as the difference
    % between the computed term and the last term, but a better metric
    % may be doing the actual function evaluation.
     error(i + 3) = abs(x(i + 3) - x(i + 2));
     eps = error(i + 3);

    % Update counter.
    i = i + 1;
    
    % If we run more than 1000 iterations, just stop.
    if i > 1000
        fprintf("Did not converge within 1000 iterations.")
        break
    end
    
  end % End of method loop.

% Return the output values.
iterations = i + 2;
root = x(iterations);

end % End of function
