function [ new_freq,new_eigval,new_modes ] = sort_dmd( mode_frequencies, dmd_evals, dmd_modes )
%UNTITLED2 Summary of this function goes here
%   This function sorts the frequencies, eigen values and dmd modes in the
%   increasing order of frequencies
%   Make sure that the frequency and eigen value vector are Nx1
[a_sorted,a_order] = sort(mode_frequencies);
new_freq = mode_frequencies(a_order,1);
new_eigval = dmd_evals(a_order,1);
new_modes = dmd_modes(:,a_order);
end

