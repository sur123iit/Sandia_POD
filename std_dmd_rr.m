function [ Qx, dmd_vec, dmd_evals,dmd_modes,mode_frequencies ] = std_dmd_rr( x,y,r,Fs )
%UNTITLED Summary of this function goes here
%   If you are calculating standard DMD for the entire dataset with no
%   restrictions on rank, then use r =  N-1, where N = number of snapshots
[Qx, S, V] = svd(x,0);
beta = size(x,2)/size(x,1);
omega= optimal_SVHT_coef(beta,0);
diagS = diag(S);
omega = optimal_SVHT_coef(beta,0) * median(diagS);
r = sum(diagS > omega);
Atilde = Qx' * y * V * pinv(S);% (385x6360)x(6360x385)x(385x385)x(385x385)
[dmd_vec,dmd_evals1] = eig(Atilde);
dmd_evals = diag(dmd_evals1);
dmd_modes = Qx*dmd_vec;
mode_frequencies = angle(dmd_evals)*Fs/(2*pi);
end

