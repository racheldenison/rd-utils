function tf = isneq(a, b, epsilon)
%
% function tf = isneq(a, b, [epsilon])
%
% "is nearly equal"
% tests whether a and b are within epsilon of each other. returns true if
% yes and false if no.
% epsilon is optional (default 10e-4)
%
% Rachel Denison

if nargin==2
    epsilon = 10e-4;
end

tf = abs(a-b)<epsilon;
