function [eigDec, m_index, f_index] = DecEn_eigval(eig1)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
eig2 = eig1;
eig2(:,1) = zeros(size(eig1,1),1);
sum_eig4 = sum(sum(eig2));
eig2 = eig2/sum_eig4;
eig3 = reshape(eig2,[size(eig2,1)*size(eig2,2) ,1]);
[eigDec,index_eig] = sort(eig3,'descend');
m_index = mod(index_eig,size(eig1,1));
f_index = floor(index_eig/size(eig1,1)) + 1;
end

