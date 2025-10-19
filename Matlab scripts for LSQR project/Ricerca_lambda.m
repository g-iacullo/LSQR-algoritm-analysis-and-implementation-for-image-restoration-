
% definiamo i punti in cui cercare il parametro lambda migliore
n=50;
range = [0,logspace(-6, 0, n)];
n= n + 1;

%registriamo i risultati per ogni scelta di lambda (incluso 0)
v=zeros(n,1);

I = double(imread('hubble.tif')) / 255;
X = rand(18); X = X / norm(X(:), 1);
I_sfocata = conv2(I, X, 'same');

for j = 1:n
    lambda = range(j);
    Immagine_recuperata = ALg_LSQR_regolarizzato(X, I_sfocata(:), lambda);
    v(j) = norm(Immagine_recuperata - I(:)); %errore in norma Frobenius
end

[~, idx]=min(v);
lambda=range(idx)

plot(range, v, 'o')















