function [osd_a] = pwr_sp_dnst( a,Fs )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%   a should be a column vector, i.e. its form should be Nx1
[N1,N2] = size(a);
a_bar = fft(a);
psd_a = conj(a_bar).*a_bar;
psd_a = 2*psd_a;
psd_a = psd_a/(N1*Fs);
osd_a(:,:) = psd_a(1:N1/2,:);
end