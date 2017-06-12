function [F, pval] = ftestnested(rss1, rss2, p1, p2, n)

% rss is residual sum of squares
% p is number of parameteres
% n is number of data points
%
% model 1 is the restricted model
% model 2 is the full model
% so p2 > p1, and rss1 > rss2
%
% https://en.wikipedia.org/wiki/F-test

F = ((rss1-rss2)./(p2-p1))./(rss2./(n-p2));

df1 = p2-p1;
df2 = n-p2;

pval = 1 - fcdf(F, df1, df2);