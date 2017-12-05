function y = wmean(x,w,dim)
%
% function y = wmean(x,w,dim)
%
% Take a weighted mean of x.
%
% x is an n-d matrix 
% w is a vector of weights
% dim is the dimension of x over which to take the weighted mean.

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

% weighted mean
y = sum(x.*W, dim);