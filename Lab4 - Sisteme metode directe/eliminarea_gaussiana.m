function [rez] = eliminarea_gaussiana(A, n)
	% Eliminarea gaussiana cu pivotare partiala
	% input:	A - matrice extinsa a sistemului
	%			n - numarul de ecuatii
    % output:	solutiile sistemului sau un mesaj de eroare
	
	% alegem cel mai mic intreg i <= p <= n, a.i. |A[p,i]| = max(A[j,i]), i <= j <= n
    for i = 1:n
        nlin(i) = i;
    end
    
    for i = 1 : n-1
        p = i;
        max = A(nlin(p),i);
        for j = i + 1:n
            if A(nlin(j),i) > max
                p = j;
                max = A(nlin(j),i);
            end
        end
        
		% daca A[p,i] = 0 sistemul nu are solutie unica.
        if A(nlin(p),i) == 0
            error("Sistemul nu are solutie unica.");
            return
        end
        
		% interschimbam liniile
        if nlin(i) ~= nlin(p)
           aux = nlin(i);
           nlin(i) = nlin(p);
           nlin(p) = aux;
        end
        
		% reducem liniile
        for j = i + 1:n
            m(nlin(j),i) = A(nlin(j),i)/A(nlin(i),i);
            
            for k = 1: n+1
               A(nlin(j),k) = A(nlin(j),k) - m(nlin(j),i) * A(nlin(i),k); 
            end
        end
    end
    
	% Daca A[n,n] = 0 sistemul nu are solutie unica.
    if A(nlin(n),n) == 0
        error("Sistemul nu are solutie unica");
        return
    end
    
	% compunem solutia finala
    rez(n) = A(nlin(n),n+1)/A(nlin(n),n);
    for i = n-1: -1 : 1
        suma = 0;
        for j = i+1 : n
           suma = suma + A(nlin(i),j) * rez(j); 
        end
        rez(i) = (A(nlin(i),n+1) - suma)/A(nlin(i),i);
    end
end