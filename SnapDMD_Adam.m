function DMDout = SnapDMD(X,dt,varargin)
%DMDout = SnapDMD(X,dt,x_grid,y_grid,'method') returns the variables from DMD applied to X.
% Inputs:   X                = Data matrix
%           dt               = Time between snapshots
%           method           = svd or snapshot methods (string)
% Optional Inputs:
%           x_grid,y_grid    = Grid spacing matrices(X&Y required)(M=1 o/w)
% Outputs:  DMDout.X         = X; %Dataset
%           DMDout.PHI       = Phi; %DMD Modes
%           DMDout.Eigval    = lam; %Complex Eigenvalues
%           DMDout.Freq      = freq; %Modal Frequency
%           DMDout.Grow      = growth; %Modeal Growth Rate
%           DMDout.E         = ener; %Modal Energy scaled by eigenvalues
%           DMDout.U_Ortho   = U; %POD Modes
%           DMDout.r         = r; %Residual Vector
%           DMDout.x         = x_grid; %X Grid Spacing
%           DMDout.y         = y_grid; %Y Grid Spacing
% X is an P x T matrix, P is the number of Probe Measurements (times number
% of velocity componenets), T is the number of snapshots or time instances
% Created by Adam Nickels

%% Setup Data
if nargin>3
x_grid=varargin{1,1};y_grid=varargin{1,2};
dx=abs(x_grid(1,1)-x_grid(1,2)); %Grid Spacing X
dy=abs(y_grid(1,1)-y_grid(2,1)); %Grid Spacing Y
M=dx*dy;
else
M=1;    
end
K=X(:,1:end-1); Kp=X(:,2:end); %Create Data Matrices Shifted in Time
%% Create Kernel
if any(strcmp(varargin,'svd')); %SVD
[U, Sigma, V] = svd(K,0); %Economy SVD of K 
%Sidenote: U and V are the topos and chronos from Biorthogonal Decomposition
Kernel=(U'*M*Kp*V)/Sigma; clear Sigma V;
elseif any(strcmp(varargin,'snapshot')); %Snapshot
[W, Sigma2, ~] = svd(K'*M*K);  %~ IS TRANSPOSED BY MATLAB ALREADY
% WT' cols. are eigenvectors of M*M, W are eigenvectors of MM*, Sigma2 are eignevalues of both
U=K*W*Sigma2^(-1/2); %U are the POD modes [proof svd(K)=USigmaW; : test=U*Sigma2^(1/2)*W'];
Kernel=U'*M*Kp*W*Sigma2^(-1/2); clear W Sigma2;
else
error('Invalid Inputs: Method');
end
%% Compute Outputs
[eigvec, eigval]=eig(Kernel); clear Kernel;
Phi=U*eigvec; Scale=Phi\K(:,1); 
Phi=Phi.*repmat(Scale.',size(Phi,1),1); %Scaled so sum(PHI,2) = K(:,1)
lam=diag(eigval); %Complex Eigenvalues
%freq=abs((atan(imag(lam)./real(lam))))/(2*pi*dt); %Mode Frequencies (Rad)
freq=abs(angle(lam))/(2*pi*dt); %Mode Frequencies (Rad), angle accounts for quadrant (Im vs -Im , etc.)
growth=(sqrt(real(lam).^2+imag(lam).^2)); %Mode Growth Rates
for i=1:1:size(eigvec,1)
E(i,1)=(norm(Phi(:,i),2)); %*lam(i,1); %Mode 2-Norm Energy
end
E=E./norm(X,'fro'); %Normalize by Total Energy
% E=E/max(E); %Normalize by Itself
r = X(:,end)-(Phi*lam.^size(K, 2)); %Residual
%% Reorder Modes
[freq, index]=sort(freq,1,'descend');
Phi=Phi(:,index); E=E(index,1);
%% Form the output structure
DMDout.X         = X; %Dataset
DMDout.PHI       = Phi; %DMD Modes
DMDout.Eigval    = lam; %Complex Eigenvalues
DMDout.Freq      = freq; %Modal Frequency
DMDout.Grow      = growth; %Modeal Growth Rate
DMDout.E         = E; %Modal Energy Scaled by Eigenvalues
DMDout.U_Ortho   = U; %POD Modes
DMDout.r         = r; %Residual Vector
if nargin>3
DMDout.x         = x_grid; %X Grid Spacing
DMDout.y         = y_grid; %Y Grid Spacing
end
end
