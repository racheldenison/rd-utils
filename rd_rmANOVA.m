function [fvals, pvals, rowNames, ranovatbl] = rd_rmANOVA(data, condNames, factorNames, nLevels)

% N-way repeated-measures anova
% % example inputs
% data = randn(24,8); % subjects x conditions
% condNames = {'Y1','Y2','Y3','Y4','Y5','Y6','Y7','Y8'}; 
% factorNames = {'TestCond','Attention','TMS'};
% nLevels = [2 2 2]; % how many levels per factor

%% organize data
% create a data table, subjects x conditions
dataTable = array2table(data,'VariableNames',condNames);

% create a table reflecting the within subject factors and their levels
f = fliplr(fullfact(nLevels)); % coarse to fine groupings - make sure data is organized like this
factorTable = array2table(categorical(f),'VariableNames',factorNames);

%% model
% fit the repeated measures model
modelSpec = sprintf('%s-%s~1', condNames{1}, condNames{end});
rm = fitrm(dataTable, modelSpec,'WithinDesign',factorTable);

% run the anova
WM = factorNames{1};
for iF = 2:numel(factorNames)
    WM = sprintf('%s*%s',WM,factorNames{iF});
end
ranovatbl = ranova(rm, 'WithinModel',WM);

%% stats
% extract relevant F and p values
fvals0 = [ranovatbl.F];
pvals0 = [ranovatbl.pValue];

rowNames0 = ranovatbl.Properties.RowNames;
rowIdx = 3:2:numel(rowNames0); % (Intercept) rows, skip first one
if nargout>2 % avoid this internal loop if not needed
    for iR = 1:numel(rowIdx)
        rowNames{iR} = rowNames0{rowIdx(iR)}(13:end);
    end
end

fvals = fvals0(rowIdx);
pvals = pvals0(rowIdx);
