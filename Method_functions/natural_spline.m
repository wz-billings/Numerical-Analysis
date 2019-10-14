function [out] = natural_spline(x,y)
%NATURAL_SPLINE computes the natural cubic splines between the data.

  % Initialize constants.
    N = length(x)-1; %Number of subintervals; 1 less than number of datapoints.
    h = x(2) - x(1); %Equidistant data spacing.

  %Defining the matrix A, used to find {c}.
    e = ones(N+1,1);
    A = spdiags([e 4*e e], [-1 0 1], N + 1, N + 1);

  % Natural boundary conditions
    A(1,1) = 1;
    A(1,2) = 0;
    A(N+1,N+1) = 1;
    A(N+1,N) = 0;

  %First, find {a}:
    a = y;

  %Second, solve Ax=b to find {c}:
    for i = 2:N
      vec(i) = a(i-1) - 2 .* a(i) + a(i+1);
    end
  
    vec = (3 / (h^2)) * vec';
    % Natural spline conditions
      vec(1) = 0;
      vec(N+1) = 0;
    c = inv(A)*vec;

  %Third, use {c} to find {b} and {d}:
    for i = 1:N
      b(i) = (1/h) * (a(i + 1) - a(i)) - (h/3) * (2 * c(i) + c(i+1));
      d(i) = (1/(3*h))*(c(i+1)-c(i));
    end
    
   % Construct matrix of outputs
    out = [a(1:N)', b', c(1:N), d'];
    

  %Plotting the spline interpolant:
  %The loop evaluates the spline over each subinterval [x_i,x_{i+1}],
  %and superimposes them on the same plot.
    figure()
    for i = 1:N
      xx = linspace(x(i),x(i+1));
      yy = a(i)+b(i)*(xx-x(i))+c(i)*(xx-x(i)).^2+d(i)*(xx-x(i)).^3;
      plot(xx,yy)
      hold on
    end
    plot(x,y,'o')  
  
end
