function [x] = backward_substitution(U, B)
    n = length(B);
    x = zeros(size(B));
    for k = n : -1 : 1
        x(k) = (B(k) - U(k,k+1:n) * x(k+1:n))/U(k,k);
    end
end

