function plotboxes(xs,ys,color,edgecolor)

% function plotboxes(xs,ys,color)
% 
% xs and ys are n-by-2. must have same n, or one must have n=1.
% color is optional (default = light gray)
% edgecolor is optional (default = none)

% deal with inputs
if nargin < 3
    color = [.9 .9 .9];
end
if nargin < 4
    edgecolor = 'none';
end

if size(xs,1)>size(ys,1)
    if size(ys,1)~=1
        error('ys must be size of xs or 1x2')
    else
        ys = repmat(ys,size(xs,1),1);
    end
elseif size(ys,1)>size(xs,1)
    if size(xs,1)~=1
        error('xs must be size of ys or 1x2')
    else
        xs = repmat(xs,size(ys,1),1);
    end
end

% plot
for iBox = 1:size(xs,1)
    x = xs(iBox,:);
    y = ys(iBox,:);
    
    fill([x(1) x(2) x(2) x(1)], [y(1) y(1) y(2) y(2)], ...
        color, 'EdgeColor', edgecolor)
end