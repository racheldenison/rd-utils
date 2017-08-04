function bkax = rd_bigAxisLabels(myXLabel, myYLabel, myTitle, fH)

if nargin<4
    fH = gcf;
end
if nargin<3
    myTitle = [];
end
if nargin<2
    myYLabel = [];
end

bkclr = get(fH,'Color');
bkax = axes; % this creates a figure-filling new axes
bkax.Position = (bkax.Position-.5)*1.05+.5; % expand the axis slightly
set(bkax,'Xcolor',bkclr,'Ycolor',bkclr,'box','off','Color','none') % make it 'disappear'
title(myTitle)
xlabel(myXLabel,'Color','k')
ylabel(myYLabel,'Color','k')
