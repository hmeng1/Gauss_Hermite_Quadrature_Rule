function [snodes,sweights] = GridQuadrature(numQuad,numVar,varargin)

parser = inputParser();
parser.addOptional('sparse',false);
parser.parse(varargin{:});

if parser.Results.sparse == false || numVar == 1
    [snodes,sweights] = FullGridQuadrature(numQuad,numVar);
else
    [snodes,sweights] = generate_md_points(numQuad,numVar,2);
end

end