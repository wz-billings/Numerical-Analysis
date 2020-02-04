function [root,iterations] = bisection_method_while(a,b,tol,f)
  a_n = a;
  b_n = b;
  error = 1;
  i = 0;

  while(error > tol)
    i = i + 1;
    p(i) = (a_n + b_n)/2;

    if (f(p(i)) == 0)
      break
    end

    if (f(a_n)*f(p(i)) < 0)
      b_n = p(i);
    else
      a_n = p(i);
    end

    if (i > 1)
      error = abs(p(i) - p(i - 1));
    end
  end

  root = p(i);
  iterations = i;
end
