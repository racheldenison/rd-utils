function print_pdf(filename, directory)

% function print_pdf(filename, directory)

if nargin>1
    filename = sprintf('%s/%s',directory,filename);
end

set(gcf, 'paperunits', 'points')
pos = get(gcf, 'position');
set(gcf, 'papersize', pos(3:4))
set(gcf, 'paperpositionmode','auto')
print(gcf, '-dpdf', filename)