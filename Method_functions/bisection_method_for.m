function [root,iterations] = bisection_method_for(a,b,n,f)
  a_n = a;
  b_n = b;
  p = zeros(n,1);

  for (i = 1:n)
    p(i) = (a_n + b_n)/2;

    if (f(p(i)) == 0)
      break
    end

    if (f(a_n)*f(p(i)) < 0)
      b_n = p(i);
    else
      a_n = p(i);
    end
    
    if (f(p(i))) == 0
      break
    end
  end

root = p(i);
iterations = i;
end
