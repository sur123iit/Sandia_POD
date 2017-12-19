%Implementing Section 4.2 from Colonius Spectral POD paper
%Section Name: 4.2 An ensemble DMD problem for stationary flows
n = 4; % you need to automate this or put in the right number.
Tx = eye(n-1);
Ty = eye(n-1);
cat_mat = zeros(1,n-1);
Tx = vertcat(Tx,cat_mat);
Ty = vertcat(cat_mat,Ty);
