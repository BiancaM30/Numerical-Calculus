function [rez] = rezolvare_Cholesky(A, B)
    % A = R'*R
    % A*x = B => R'*R*x = B => R'*y = B => y
    % R*x = y => x
    R = descompunere_Cholesky(A);
    y = forward_substitution(R', B);
    rez = backward_substitution(R, y);
end