function solution = gprelax(A,x)
%  function gprelax
%  Perform GP multinomial likeliohood optimization 
%  x must be row vector (1 x k array)
%  A must be matix of constraint coefficients, in q x k array
%  One should include the trivial constraint [1,1,...,1] in A, if
%  necessary.
%  The RHS of constraint must be standardized to 1.

k = length(x);
q= size(A,1);
x=x';
gpvar p(k);
obj = prod(p .^ x);
% constmat = [ones(k,1),A']';
constmat=A;
constr = constmat * p <= ones(q,1);
[obj_value,sol,status] = gpsolve(obj,constr,'max');
solution= cell2mat(sol(1,2));
end

