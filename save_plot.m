function [] = save_plot(name_str )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
fpath = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\graphs\';
saveas(gca, fullfile(fpath, name_str),'png');

end

