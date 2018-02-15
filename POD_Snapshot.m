function [ eigvec, eigval1, PODcoeff, Phi ] = POD_Snapshot( c1,c2 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
X_mat = vertcat(c1,c2);
C_mat = (X_mat'*X_mat);
[eigvec,eigval] = svd(C_mat);
Phi = X_mat * eigvec * 1/sqrt(eigval);
PODcoeff = eigvec * sqrt(eigval);
eigval1 = diag(eigval);
end

