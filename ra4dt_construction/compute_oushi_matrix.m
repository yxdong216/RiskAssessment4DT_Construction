function BAA_oushi = compute_oushi_matrix(jiaquan_matrix, border_vector)
    BAA_oushi = zeros(23, 3);
    for i = 1:23
        BAA_oushi(i, 1) = sqrt(sum((jiaquan_matrix(i, 1:4) - border_vector(1:4)).^2));
        BAA_oushi(i, 2) = sqrt(sum((jiaquan_matrix(i, 5:8) - border_vector(5:8)).^2));
        BAA_oushi(i, 3) = sqrt(sum((jiaquan_matrix(i, 9:12) - border_vector(9:12)).^2));
    end
end
