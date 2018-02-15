function [ Qx, dmd_vec, dmd_evals, dmd_modes ] = exact_dmd( x,y,r )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%   If you are calculating standard DMD for the entire dataset with no
%   restrictions on rank, then use r =  N-1, where N = number of snapshots
[Qx, S, V] = svd(x,0);
%Qx = Qx(:,1:r);
%S = S(1:r,1:r);
%V = V(:,1:r);
Atilde = Qx' * y * V * pinv(S);
[dmd_vec,dmd_evals] = eig(Atilde);
dmd_modes = y*V*pinv(S)*dmd_vec;
end

