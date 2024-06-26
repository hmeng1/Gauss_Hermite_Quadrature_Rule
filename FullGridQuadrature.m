function [qnodes,qweight] = FullGridQuadrature(numQuad,numVar)
%n: the number of quadrature points
%dim: the number of variables


[qnodes,qweight] = GaussHermite(numQuad);

qnodes = qnodes';
qweight = qweight';

[qnodes,Index] = npermutek(qnodes',numVar);
qnodes = (abs(qnodes) >1e-10).*qnodes;

if sum(Index) == numVar
    qweight = 1;
else
    qweight = prod(qweight(Index),2);
end

qnodes = transpose(qnodes);
qweight = transpose(qweight);
end