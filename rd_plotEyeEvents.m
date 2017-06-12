function rd_plotEyeEvents(datafile)

% datafile = '../raw/pupiltest_ellipse.dat';

data = load(datafile,'-ascii');

ncols = size(data,2);
figure
for i=1:ncols
    subplot(ncols,1,i)
    plot(data(:,i))
end

figure
plot(repmat(data(:,1),1,2), data(:,2:3))