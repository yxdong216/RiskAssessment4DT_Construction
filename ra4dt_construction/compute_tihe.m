function TOPSIS_tihe = compute_tihe(input_matrix)
    [nRows, ~] = size(input_matrix);
    TOPSIS_tihe = zeros(nRows, 1);
    for i = 1:nRows
        B = input_matrix(i, 1);
        F = input_matrix(i, 2);
        J = input_matrix(i, 3);
        TOPSIS_tihe(i) = B + F + J;
    end
end
