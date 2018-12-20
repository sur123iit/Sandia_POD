function [ eigvec, eigval1, PODcoeff, Phi ] = POD_clas(X_mat)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
% normalize phi
C_mat = (X_mat*X_mat');
[eigvec,eigval] = svd(C_mat);
Phi = eigvec*1/sqrt(eigval);
PODcoeff = eigvec * sqrt(eigval);
eigval1 = diag(eigval);
end

