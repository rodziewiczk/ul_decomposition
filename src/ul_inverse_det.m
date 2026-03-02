function [A_inv, det_A] = calculate_A_inv_and_det(L, U)
    % calculate_A_inv_and_det Oblicza odwrotność i wyznacznik macierzy A
    % na podstawie jej rozkładu UL.
    %
    % Wejście:
    %   U - Macierz górnotrójkątna z rozkładu UL
    %   L - Macierz dolnotrójkątna z rozkładu UL
    %
    % Wyjście:
    %   A_inv - Odwrotność macierzy A
    %   det_A - Wyznacznik macierzy A

    % Obliczenie wyznacznika A jako produktu elementów na głównej przekątnej macierzy U
    det_A = prod(diag(U));
    
    % Obliczenie A^-1
    n = size(U, 1);
    A_inv = zeros(n);
    
    % Rozwiązanie n układów równań ULx = I dla każdej kolumny macierzy A^-1
    for i = 1:n
        e = zeros(n, 1);
        e(i) = 1;
        
        % Rozwiązanie Uy = e
        y = backward_substitution(U, e);
        
        % Rozwiązanie Lx = y
        x = forward_substitution(L, y);
        
        % Przypisanie kolumny do A_inv
        A_inv(:, i) = x;
    end
end

function y = forward_substitution(L, b)
    % forward_substitution Rozwiązuje równanie Lx = b dla macierzy dolnotrójkątnej L
    %
    % Wejście:
    %   L - Macierz dolnotrójkątna
    %   b - Wektor prawych stron równania
    %
    % Wyjście:
    %   y - Rozwiązanie równania Lx = b

    n = length(b);
    y = zeros(n, 1);
    for i = 1:n
        y(i) = b(i) - L(i, 1:i-1) * y(1:i-1);
    end
end

function x = backward_substitution(U, y)
    % backward_substitution Rozwiązuje równanie Ux = y dla macierzy górnotrójkątnej U
    %
    % Wejście:
    %   U - Macierz górnotrójkątna
    %   y - Wektor prawych stron równania
    %
    % Wyjście:
    %   x - Rozwiązanie równania Ux = y

    n = length(y);
    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = (y(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
    end
end
