function [L, U] = doolittle(A)
    % doolittle Rozkłada macierz A na iloczyn macierzy górnotrójkątnej U 
    % i dolnotrójkątnej L z jedynkami na przekątnej.
    %
    % Wejście:
    %   A - Macierz kwadratowa nxn do rozkładu.
    %
    % Wyjście:
    %   L - Macierz dolnotrójkątna z jedynkami na głównej przekątnej.
    %   U - Macierz górnotrójkątna.
    
    n = size(A, 1); % Pobranie rozmiaru macierzy A.
    
    U = zeros(n, n); % Inicjalizacja U jako macierzy zerowej.
    L = eye(n);      % Inicjalizacja L jako macierzy jednostkowej (z jedynkami na przekątnej).

    % Przeprowadzenie faktoryzacji Doolittle'a
    % Ustawienie ostatniej kolumny U zgodnie z odpowiednią kolumną macierzy A.
    U(:, end) = A(:, end);

    % Iteracja wsteczna dla obliczenia macierzy L i U.
    for i = n:-1:1
        % Obliczenie elementów macierzy L w i-tym wierszu.
        L(i, 1:i-1) = (A(i, 1:i-1) - U(i, i+1:n) * L(i+1:n, 1:i-1)) / U(i, i);

        % Obliczenie elementów macierzy U w kolumnach powyżej diagonalnej.
        % To jest wykonywane tylko jeśli nie jesteśmy w pierwszej kolumnie.
        if i > 1 
            for j = i-1:-1:1
                U(j, i-1) = A(j, i-1) - U(j, j+1:n) * L(j+1:n, i-1);
            end
        end
    end
end
