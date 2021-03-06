function [ L,D,Ma,Uinf,Fs,N,Nb ] = load_parameters( proj_num )
%UNTITLED Summary of this function goes here
%   proj_num =1 for the Sandia Cavity Project
L = 0;
D = 0;
Ma = 0;
Uinf = 0;
N = 0;
Nb = 0;
Fs = 0;
if proj_num == 1
    L = 127*10^-3;
    D = 25.4*10^-3;
    Ma = 0.8;
    Uinf = 280;
    N = 386;
    Nb = 280;
    Fs = 37500;
elseif proj_num == 2
    L = 127*10^-3;
    D = 25.4*10^-3;
    Ma = 0.6;
    Uinf = 272.23;
    N = 386;
    Nb = 260;
    Fs = 37500;
elseif proj_num == 3
    L = 127*10^-3;
    D = 25.4*10^-3;
    Ma = 0.94;
    Uinf = 272.23;
    N = 386;
    Nb = 280;
    Fs = 37500;
end

end

