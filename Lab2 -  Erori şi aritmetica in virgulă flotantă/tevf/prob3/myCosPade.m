function y = myCosPade( x, m, n )
% C matrix
c = zeros(1, m + n);
k = 0;
% serie alternanta
for p = 0 : m + n
    if mod(p, 2) ~= 0
        c(p + 1) = 0;
    else
        c(p + 1) = (-1)^k / factorial(2*k);
        k = k + 1;
    end
end

% matricea Toeplitz ; am adaugat 1 din cauza offsetului 
T = toeplitz(c(m + 1 : m + n), fliplr(c(m - n + 2 : m + 1)));

% partea dreapta ; trebuie rotita
rs = c(m + 2 : m + n + 1);
rs = fliplr(rs);
rs = rot90(rs);
rs = arrayfun(@(x) -x, rs);

X = linsolve(T, rs); % rezolvam ecuatia

% valorile lui b
b = zeros(n + 1,1);
b(1) = 1;
for i = 1:n
    b(i + 1) = X(i, 1);
end
if m > n
    for i = n + 2 : m + 1
        b(i) = 0;
    end
end

% valorile lui a
a = zeros(m + 1, 1);
for j = 0 : m
    s = 0;
    for l = 0 : j
        s = s + c(j - l + 1) * b(l + 1);
    end
    a(j + 1) = s;
end

% partea de sus
r1 = 0;
for i = 0 : m
    r1 = r1 + a(i + 1) * x^i;
end

% partea de jos
r2 = 0;
for j = 0 : n
   r2 = r2 + b(j + 1) * x^j;
end

y = r1 / r2;
end

