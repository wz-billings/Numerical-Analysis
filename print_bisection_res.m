function [] = print_bisection_res(problem, root, iterations)

  fprintf('Problem %s:\n', problem)
  fprintf('Within tolerance after %g iterations.\n',iterations)
  fprintf('Approximation to root is %f\n\n',root)

end
