function y = matvec(v, X, flag)
%MATVEC Calcola A * v, oppure A' * v, dove A è la convoluzione 2D
%
% Si assume che la matrice data in input sia quadrata.

% Dimensione della matrice
% supponendo che il vettore sia la
% vettorizzazione di un'immagine n x n
n = sqrt(length(v));

if strcmp(flag, 'notransp')
    y = conv2(reshape(v, n, n), X, 'same');
    y = y(:); 
    return;
end

if strcmp(flag, 'transp')
    y = conv2(reshape(v, n, n), X(end:-1:1, end:-1:1), 'same');
    y = y(:);
    return;
end

error('Flag non supportata');

end

