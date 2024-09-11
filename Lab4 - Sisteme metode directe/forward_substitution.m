function [x] = forward_substitution(L, B)
    x = zeros(size(B));
    n = length(B);
    for k = 1:n
        x(k) = (B(k) - L(k,1:k-1) * x(1:k-1))/L(k,k);
    end 
end

