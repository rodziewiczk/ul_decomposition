rng(0, 'twister');

% Generowanie macierzy testowych
A1 = rand(3, 3);
A2 = rand(10, 10);
A3 = rand(100, 100);
A4 = rand(250, 250);
A5 = rand(375, 375);
A6 = rand(500, 500);
A7 = rand(650,650);
A8 = rand(750,750);

% Linia rozdzielająca o odpowiedniej długości
separatorLine = repmat('-', 1, 113);

% Nagłówek tabeli
disp(separatorLine);
disp('| Rozmiar macierzy | Błąd bezwzględny odwrotności | Błąd względny odwrotności | Błąd bezwzględny wyznacznika | Błąd względny wyznacznika |');
disp(separatorLine);


% Testowanie i wyświetlanie wyników dla każdej macierzy
test_and_display_results(A1, '3x3');
test_and_display_results(A2, '10x10');
test_and_display_results(A3, '100x100');
test_and_display_results(A4, '250x250');
test_and_display_results(A5, '375x375');
test_and_display_results(A6, '500x500');
test_and_display_results(A7, '650x650');
test_and_display_results(A8, '750x750');


% Zakończenie tabeli
disp(separatorLine);

% Funkcja do testowania i wyświetlania wyników
function test_and_display_results(A, size_description)
    [inv_err_abs, inv_err_rel, det_err_abs, det_err_rel] = validate_doolittle_and_inv_det(A);
    fprintf('| %-15s | %-28e | %-26e | %-26e | %-26e |\n', size_description, inv_err_abs, inv_err_rel, det_err_abs, det_err_rel);
end