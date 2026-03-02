% Ustawienie ziarna dla generatora liczb losowych
rng(0, 'twister');
warning('off', 'all');


% Generowanie macierzy testowych
A_diag_dom = diag(5*ones(5,1)) + rand(5,5); % Macierz diagonalnie dominująca
A_sym_pos_def = rand(5,5); 
A_sym_pos_def = A_sym_pos_def' * A_sym_pos_def; % Symetryczna, dodatnio określona
A_singular_1 = [1, 2, 3; 2, 4, 6; 3, 6, 9]; % Macierz osobliwa 1
A_singular_2 = [1,2,3;4,5,6;7,8,9]; % Macierz osobliwa 2
A_hilbert = hilb(14); % Macierz Hilberta
A_with_zero_1=[1,2,3;4,5,6;7,8,0]; % Macierz z zerem w prawym dolnym
A_with_zero_2=[7,6,1;4,5,1;8,10,2]; % Macierz taka, ze U(2,2)=0
% Testowanie i wyświetlanie wyników dla każdej macierzy
test_and_display_results2(A_diag_dom, 'Macierz diagonalnie dominująca:');
test_and_display_results2(A_hilbert, 'Macierz Hilberta:');
test_and_display_results2(A_singular_1, 'Macierz osobliwa_1:');
test_and_display_results2(A_singular_2, 'Macierz osobliwa_2');

[L,U]=doolittle(A_singular_2);
disp("A_singular_2:");
A_singular_2
U
L
disp("UL:")
U*L

test_and_display_results2(A_sym_pos_def, 'Macierz symetryczna i dodatnio określona:');
test_and_display_results2(A_with_zero_1,'Macierz z zerem w prawym dolnym rogu');
test_and_display_results2(A_with_zero_2,'Macierz taka, ze U(2,2) = 0');


% Funkcja do testowania i wyświetlania wyników
function test_and_display_results2(A, description)
    [inv_err_abs, inv_err_rel, det_err_abs, det_err_rel] = validate_doolittle_and_inv_det(A);
    disp(description);
    fprintf('Błąd bezwzględny odwrotności: %e\n', inv_err_abs);
    fprintf('Błąd względny odwrotności: %e\n', inv_err_rel);
    fprintf('Błąd bezwzględny wyznacznika: %e\n', det_err_abs);
    fprintf('Błąd względny wyznacznika: %e\n\n', det_err_rel);
end