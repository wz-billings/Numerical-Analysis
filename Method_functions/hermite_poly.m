function [out] = hermite_poly(x, y, d, p)
%HERMITE_POLY This function computes the Hermite polynomial
% passing through the dataset {x,y}, evaluated at the set of points p.
% Author: Zane Billings
% Date: 2019-10-09
% Args: x data, y data, y' data, points to evaluate at.

N = length(x);

A(:,1) = y; % First column of divided differences is function values.

for k = 2:N % Calculate second column values
  if mod(k,2) == 0
    A(k,2) = d(k);
  else 
    A(k,2) = ( A(k,1) - A(k-1,1) ) / (x(k) - x(k-1));
  end
end

for j = 3:N
    for i = j:N
        A(i,j) = ( A(i,j-1) - A(i-1,j-1) ) / (x(i) - x(i-j+1));
    end
end

out = diag(A);

end