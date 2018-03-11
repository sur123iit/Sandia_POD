function [ eigvec, eigval1, PODcoeff, Phi ] = POD_Snapshot( X_mat )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
C_mat = (X_mat'*X_mat);
[eigvec,eigval] = svd(C_mat);
Phi = X_mat * eigvec * 1/sqrt(eigval);
PODcoeff = eigvec * sqrt(eigval);
eigval1 = diag(eigval);
end