%SINGULAR VALUE DECOMPOSITION
%For reduced svd use:
[U,S,V] = svd(x,0);% S and V here are square matrices
%If x = MxN, then, U: MxN, S: NxN, V: NxN

%Full svd
[U,S,V] = svd(x);
%If x = MxN, then, U: MxM, S: MxN, V:NxN

%Econ svd
[U,S,V] = svd(x,'econ');
%If x = MxN, then, U: MxN, S: NxN, V:NxN

%S remains unchanged except for extra zeros in this
%norm(U) = 1; in all the cases
%CHECK HOW U LOOKS LIKE IN BOTH THE CASES AND WHAT IS THE DIFFERENCE
%% EIG FUNCTION
%cannot be applied on rectangular matrix

%% QR DECOMPOSITION


%%
theta = 0.3;
A = [cos(theta) -sin(theta); sin(theta) cos(theta)];
[U,S,V] = svd(A);
[eigvec, eigval] = eig(A);
%%