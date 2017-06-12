function equalizeYLims

% makes ylims go same distance above and below zero
% no arguments. works on current axis.

ylims0 = get(gca,'YLim');
maxy = max(abs(ylims0));
ylim([-maxy maxy])