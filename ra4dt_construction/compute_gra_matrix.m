function gra_matrix = compute_gra_matrix(jiaquan_matrix, lixiang_vector)
    gra_matrix = zeros(23, 3);
    for i = 1:23
        gra_matrix(i, 1) = sqrt(sum((jiaquan_matrix(i, 1:4) - lixiang_vector(1:4)).^2));
        gra_matrix(i, 2) = sqrt(sum((jiaquan_matrix(i, 5:8) - lixiang_vector(5:8)).^2));
        gra_matrix(i, 3) = sqrt(sum((jiaquan_matrix(i, 9:12) - lixiang_vector(9:12)).^2));
    end
end
