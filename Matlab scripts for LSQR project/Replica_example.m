
I_originale = double(imread('hubble.tif')) / 255;

%Sfocatura, normalizzata 
X = rand(18); X = X / norm(X(:), 1);

I_sfocata = conv2(I_originale, X, 'same');

% Recupero l'immagine con LSQR -- l'esempio qui usa LSQR di MATLAB, che
% però non permette di scegliere il parametro lambda. 

I_recuperata = Alg_LSQR(X, I_sfocata(:));

I_recuperata = reshape(I_recuperata, size(I_originale,1), size(I_originale,2));

subplot(1, 3, 1);
imshow(I_originale); title('Immagine originale');
subplot(1, 3, 2);
imshow(I_sfocata); title('Immagine sfocata');
subplot(1, 3, 3);
imshow(I_recuperata); title('Immagine recuperata');

%errore di ricostruzione
norm(I_originale-I_recuperata, 'fro')