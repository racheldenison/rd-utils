function y = wstd(x,w,dim)
%
% function y = wstd(x,w,dim)
%
% Take a weighted standard deviation of x.
%
% x is an n-d matrix 
% w is a vector of weights
% dim is the dimension of x over which to take the weighted std.
%
% https://math.stackexchange.com/questions/320441/standard-deviation-of-the-weighted-mean
% http://www.itl.nist.gov/div898/software/dataplot/refman2/ch2/weightsd.pdf

if nargin<3
    dim = 1;
end
if ~isvector(w)
    error('w must be a vector (1xn)')
end
if size(x,dim)~=length(w)
    error('the length of w must be equal to the size of x in dimension dim. default dim = 1')
end

% make w a scaled row vector
w = w/sum(w);
if size(w,1)>1
    w = w';
end

% make the weight matrix W
sz = size(x);

r = ones(size(sz));
r(dim) = sz(dim);

wr = reshape(w, r);

p = sz;
p(dim) = 1;
W = repmat(wr, p);

% make the weighted mean matrix M
m = wmean(x,w,dim);
M = repmat(m, r);

% determine n, number of nonzero weights
n = nnz(w);

% weighted std
s = sum(W.*(x-M).^2,dim);
y = sqrt(n*s./(n-1));