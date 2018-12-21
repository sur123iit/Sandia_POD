function [osf_t] = ifft_onesided(osf)
%UNTITLED17 Summary of this function goes here
%   Detailed explanation goes here
[N1,N2] = size(osf);
osf2 = conj(flip(osf,1));
osf_bar = vertcat(osf,osf2(N1,:),osf2(1:N1-1,:));
osf_t = ifft(osf_bar,'symmetric');
end

