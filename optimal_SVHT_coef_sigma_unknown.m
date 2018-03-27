function omega = optimal_SVHT_coef_sigma_unknown(beta)
    warning('off','MATLAB:quadl:MinStepSize')
    assert(all(beta>0));
    assert(all(beta<=1));
    assert(prod(size(beta)) == length(beta)); % beta must be a vector
    
    coef = (8 * beta) ./ (beta + 1 + sqrt(beta.^2 + 14 * beta +1));
    MPmedian = zeros(size(beta));
    for i=1:length(beta)
        MPmedian(i) = MedianMarcenkoPastur(beta(i));
    end
    omega = coef ./ sqrt(MPmedian);
end
    