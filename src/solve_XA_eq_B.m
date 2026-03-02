function X = solve_XA_equals_B(A, B)
    % solve_XA_equals_B Rozwiązuje równanie macierzowe XA = B
    % Używa zmodyfikowanej metody Doolittle'a do obliczenia odwrotności macierzy A
    % i wyznacznika A (który w tym przypadku nie jest potrzebny).
    %
    % Syntax: X = solve_XA_equals_B(A, B)
    %
    % gdzie:
    %     A - macierz kwadratowa o rozmiarach nxn
    %     B - macierz o rozmiarach nxn
    %
    % Returns:
    %     X - rozwiązanie macierzowe równania XA = B

    % Wywołanie funkcji doolittle do wykonania faktoryzacji LU macierzy A
    [L, U] = doolittle(A); 
    % Obliczanie odwrotności macierzy A na podstawie faktoryzacji LU
    [A_inv, ~] = calculate_A_inv_and_det(L, U);  % Tylko odwrotność jest potrzebna

    % Mnożenie macierzy B przez odwrotność A, aby uzyskać rozwiązanie X
    X = B * A_inv;  % Rozwiązanie równania XA = B
end
