function border_vector = compute_border_vector(zhuanjiajuji_matrix, FMgeshu)
    
    [nRows, nCols] = size(zhuanjiajuji_matrix);
    border_vector = zeros(1, nCols);
    for j = 1:nCols
        if ismember(j, [1,2,5,6,9,10])
            border_vector(j) = prod(zhuanjiajuji_matrix(:,j).^FMgeshu);
        else
            border_vector(j) = 1 - prod((1 - zhuanjiajuji_matrix(:,j)).^FMgeshu);
        end
    end
end
