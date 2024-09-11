function [rez] = rezolvare_LUP(L,U,P,B)
    % P*A*x = P*B => L*U*x = P*B => L*y = P*B => y
    % U*x = y => x
    y = forward_substitution(L,P*B);
    rez = backward_substitution(U,y);
    rez = rez';
end