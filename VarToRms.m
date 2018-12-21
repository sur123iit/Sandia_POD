clear all;
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\uv_rec_var.txt';
uv_var1 = uv_var*N;
uv_rms1 = sum(uv_var1,2);
uv_rms1 = uv_rms1/(N*Nb);
uv_rms = sqrt(uv_rms1);