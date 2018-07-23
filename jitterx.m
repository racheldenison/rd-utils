function jitters = jitterx(ax,jitProp)

if nargin==1
    jitProp = .1;
end

nChildren = numel(ax.Children);
x0 = ax.Children(1).XData;
jit = mean(diff(x0))*jitProp;
jitters0 = cumsum(repmat(jit,1,nChildren));
jitters1 = jitters0 - mean(jitters0);
jitters = jitters1(end:-1:1);

for iCh = 1:nChildren
    ax.Children(iCh).XData = ax.Children(iCh).XData + jitters(iCh);
end