function [qnodes,qweight] = FullGridQuadrature(numQuad,numVar)
%n: the number of quadrature points
%dim: the number of variables


[qnodes,qweight] = GaussHermite(numQuad);

qnodes = qnodes';
qweight = qweight';

[qnodes,Index] = npermutek(qnodes',numVar);
qnodes = (abs(qnodes) >1e-10).*qnodes;

qweight = prod(qweight(Index),2);

qnodes = transpose(qnodes);
qweight = transpose(qweight);
end