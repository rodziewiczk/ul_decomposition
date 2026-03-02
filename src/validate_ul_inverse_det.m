function [inv_error_abs, inv_error_rel, det_error_abs, det_error_rel] = validate_doolittle_and_inv_det(A)
    % validate_doolittle_and_inv_det Waliduje wyniki rozkładu UL i obliczeń odwrotności i wyznacznika macierzy.
    %
    % Funkcja porównuje wyniki uzyskane za pomocą zaimplementowanych funkcji doolittle
    % oraz calculate_A_inv_and_det z wynikami uzyskanymi przy użyciu funkcji wbudowanych w MATLABie.
    %
    % Wejście:
    %   A - Kwadratowa macierz, która ma zostać poddana walidacji.
    %
    % Wyjście:
    %   inv_error_abs - Błąd bezwzględny obliczenia odwrotności macierzy.
    %   inv_error_rel - Błąd względny obliczenia odwrotności macierzy.
    %   det_error_abs - Błąd bezwzględny obliczenia wyznacznika macierzy.
    %   det_error_rel - Błąd względny obliczenia wyznacznika macierzy.

    % Użyj zaimplementowanej funkcji doolittle do rozkładu A na A=U*L
    [L, U] = doolittle(A);

    % Użyj zaimplementowanej funkcji calculate_A_inv_and_det do obliczenia odwrotności A i jej wyznacznika
    [A_inv, det_A] = calculate_A_inv_and_det(L, U);

    % Obliczenia przy użyciu funkcji wbudowanych w MATLABie
    A_inv_builtin = inv(A);
    det_A_builtin = det(A);

    % Obliczenie błędów bezwzględnych
    inv_error_abs = norm(A_inv - A_inv_builtin);
    det_error_abs = abs(det_A - det_A_builtin);

    % Obliczenie błędów względnych
    inv_error_rel = norm(A_inv - A_inv_builtin) / norm(A_inv_builtin);
    det_error_rel = abs(det_A - det_A_builtin) / abs(det_A_builtin);
end
