function [Q, R] = descompunere_QR(A)
    [m,n] = size(A);
    U = zeros(m,n);

    for i = 1:n 
        h = A(i:m,i);
        u = h;
        u(1) = u(1) + sign(h(1)) * norm(h);
        u = u/norm(u);
        A(i:m,i:n) = A(i:m,i:n) - 2*u * (u'*A(i:m,i:n));
        U(i:m,i) = u;   
    end
    
    R = triu(A);
    x = eye(m,n);
    for i=n:-1:1
        x(i:m,i:n) = x(i:m,i:n) - 2*U(i:m,i) * (U(i:m,i)'*x(i:m,i:n));
    end
    Q = x;
end