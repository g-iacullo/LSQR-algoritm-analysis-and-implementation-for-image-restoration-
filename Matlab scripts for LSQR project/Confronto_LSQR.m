
%confrontiamo lsqr (matlab) con Alg_LSQR

I_originale = double(imread('hubble.tif')) / 255;

% Sfocatura, normalizzata 
X = rand(18); X = X / norm(X(:), 1);

I_sfocata = conv2(I_originale, X, 'same');

% Recupero l'immagine con lsqr (matlab)
I_recuperata1 = lsqr(@(v, flag) matvec(v, X, flag), I_sfocata(:));
I_recuperata1 = reshape(I_recuperata1, size(I_originale,1), size(I_originale,2));

% Recupero l'immagine con la mia funzione Alg_LSQR
I_recuperata2 = Alg_LSQR(X, I_sfocata(:));
I_recuperata2 = reshape(I_recuperata2, size(I_originale,1), size(I_originale,2));

subplot(1, 2, 1);
imshow(I_recuperata1); title('matlab lsqr');
subplot(1, 2, 2);
imshow(I_recuperata2); title('my lsqr');

% errori in norma Frobenius
matlab_error=norm(I_recuperata1 - I_originale, 'fro')
my_error=norm(I_recuperata2 - I_originale, 'fro')
