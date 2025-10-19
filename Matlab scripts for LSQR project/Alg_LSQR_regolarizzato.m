function x = Alg_LSQR_regolarizzato(X, b, l)

    % Step 1: Inizializzazione

    u = b;
    beta = norm(u);
    u = u / beta;

    v = matvec(u, X, 'transp');
    alpha = norm(v);
    v = v / alpha;

    % m = length(b);
    n = length(v);
    % prima di impostare così le taglie, avevo m=length(b) e la davo a x
    % tramite x=zeros(m,1) ma credo fosse sbagliato perché a ragion veduita
    % x è di taglia n e non m. Ho inoltre mutato la m che non serve nel
    % resto del codice

    phi_bar = beta;
    rho_bar = alpha;

    x = zeros(n,1);  % x₀ = 0
    w = v;

    for i = 1:30

        % Step 2: Continuare la Bidiagonalizzazione

        u = matvec(v, X, 'notransp') - alpha * u;
        beta = norm(u);
        u = u / beta;

        v = matvec(u, X, 'transp') - beta * v;
        alpha = norm(v);
        v = v / alpha;

        % Step di aggiustamento

        rho_tilde = sqrt(power(rho_bar, 2) + power(l, 2));
        d = rho_bar / rho_tilde; %calcolato analogamente alla c dello step (3)
        phi_tilde = d * phi_bar;

        % Step 3: Costriure e Applicare la successiva Trasformazione
        % ortogonale

        rho = sqrt(power(rho_tilde, 2) + power(beta, 2));
        c = rho_tilde / rho;
        s = beta / rho;

        theta = s * alpha;
        rho_bar = -c * alpha;

        phi = c * phi_tilde;
        phi_bar = s * phi_tilde;

        % Step 4: Aggiornare x,w

        x = x + (phi / rho) * w;
        w = v - (theta / rho) * w;

    end
end



