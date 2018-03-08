function [ Qx, dmd_vec, dmd_evals, dmd_modes ] = exact_dmd( x,y,r )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%   If you are calculating standard DMD for the entire dataset with no
%   restrictions on rank, then use r =  N-1, where N = number of snapshots
[Qx, S, V] = svd(x,0);
Atilde = Qx' * y * V * pinv(S);
[dmd_vec,dmd_evals_mat] = eig(Atilde);
dmd_evals = diag(dmd_evals_mat);
dmd_modes = y*V*pinv(S)*dmd_vec;

end

