function [ Qx, dmd_vec, dmd_evals,dmd_modes,mode_frequencies ] = std_dmd( x,y,r,Fs )
%UNTITLED Summary of this function goes here
%   If you are calculating standard DMD for the entire dataset with no
%   restrictions on rank, then use r =  N-1, where N = number of snapshots
[Qx, S, V] = svd(x,0);
Qx = Qx(:,1:r);
S = S(1:r,1:r);
V = V(:,1:r);
Atilde = Qx' * y * V * pinv(S);
[dmd_vec,dmd_evals1] = eig(Atilde);
dmd_evals = diag(dmd_evals1);
dmd_modes = Qx*dmd_vec;
mode_frequencies = angle(dmd_evals)*Fs/(2*pi);
end
