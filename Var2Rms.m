function [uv_rms] = Var2Rms(uv_var)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
uv_var1 = uv_var*N;
uv_rms1 = sum(uv_var1,2);
uv_rms1 = uv_rms1/(N*Nb);
uv_rms = sqrt(uv_rms1);
end

