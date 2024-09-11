function [rez] = rezolvare_QR(Q, R, B)
    % A = Q*R, Q - ortoganala, Q'*Q = I
    % A*x = B => Q*R*x = B => Q'*Q*R*x = Q'*B => I*R*x = Q'*B => I*y = Q'*B
    % => y
    % R*x = y => x
    [n,~] = size(B);
    y = forward_substitution(eye(n), Q' * B);
    rez = backward_substitution(R,y);
end