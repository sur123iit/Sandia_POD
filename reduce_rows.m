function [ reduced_array ] = reduce_rows( input_array,n_rows,down_up )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%   input_array is the array which needs to get reduced
%   n_rows is the number of rows to be reduced
%   up_down can be 1 or down and 2 for up
[n1, n2] = size(input_array);
if n_rows > n1
    reduced_array = input_array;
    disp('n_rows exceeds original matrix rows');
else
    txy = eye(n1-n_rows);
    cat_mat = zeros(n1-n_rows,n_rows);
    if up_down == 1
       txy = horzcat(txy,cat_mat);
       reduced_array = txy*input_array;
    elseif up_down == 2
       txy = horzcat(cat_mat,txy);
       reduced_array = txy*input_array;
    else
        disp('choose right option ( 1 for down and 2 for up)');
    end
end
end