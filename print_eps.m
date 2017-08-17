function print_eps(filename, filedir)

if nargin>1
    filename = sprintf('%s/%s',filedir,filename);
end

print('-depsc','-painters','-loose',filename)
