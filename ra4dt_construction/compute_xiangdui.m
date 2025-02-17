function TOPSIS_xiangdui = compute_xiangdui(input_matrix)
    [nRows, ~] = size(input_matrix);
    TOPSIS_xiangdui = zeros(nRows, 1);
    for i = 1:nRows
        B = input_matrix(i, 1);
        F = input_matrix(i, 2);
        J = input_matrix(i, 3);
        TOPSIS_xiangdui(i) = sqrt(B^2 + F^2 + J^2);
    end
end
