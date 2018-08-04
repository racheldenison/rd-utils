function r = randab(a,b,sz)

% function r = randab(a,b,[sz])
%
% generate uniform random numbers from a to b, of matrix size sz
% e.g. r = randab(1,2,[100,1])
% sz is optional, defaults to 1x1

if nargin<3
    sz = 1;
end

r = a + (b-a).*rand(sz);