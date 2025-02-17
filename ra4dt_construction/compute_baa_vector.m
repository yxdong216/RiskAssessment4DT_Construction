function baa_vector = compute_baa_vector(jiaquan_matrix, FMgeshu)
    [~, nCols] = size(jiaquan_matrix);
    baa_vector = zeros(1, nCols);
    
    for j = 1:nCols
        if ismember(j, [1, 2, 5, 6, 9, 10])
            baa_vector(j) = prod(jiaquan_matrix(:, j).^FMgeshu);
        elseif ismember(j, [3, 4, 7, 8, 11, 12])
            baa_vector(j) = 1 - prod((1 - jiaquan_matrix(:, j)).^FMgeshu);
        end
    end
end
