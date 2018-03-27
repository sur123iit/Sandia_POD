function [ r] = trunc_svd( x )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
beta =  size(x,2)/size(x,1);
[U,S,V] = svd(x,0);
diagS = diag(S);
omega = optimal_SVHT_coef(beta,0)*median(diagS);
r = sum(diagS > omega);
end

