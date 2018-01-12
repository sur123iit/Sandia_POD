function [ reduced_array ] = reduce_cols( input_array,n_rows,rt_lft )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%   input_array is the array which needs to get reduced
%   n_rows is the number of rows to be reduced
%   up_down can be 1 or down and 2 for up
[n1, n2] = size(input_array);
if n_rows > n2
    reduced_array = input_array;
    disp('Error! n_rows exceeds original matrix rows');
else
    txy = eye(n2-n_rows);
    cat_mat = zeros(n_rows,n2-n_rows);
    if rt_lft == 1
       txy = vertcat(txy,cat_mat);
       reduced_array = input_array*txy;
    elseif rt_lft == 2
       txy = vertcat(cat_mat,txy);
       reduced_array = input_array*txy;
    else
        disp('Error! choose right option ( 1 for right and 2 for left)');
        reduced_array = input_array;
    end
end
end