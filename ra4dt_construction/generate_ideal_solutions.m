function [TOPSIS_lixiang1, TOPSIS_lixiang2] = generate_ideal_solutions(jiaquan_matrix, TOPSIS_score_function)
    [positive_matrix, ~] = process_ideal(jiaquan_matrix, TOPSIS_score_function, @max);
    [negative_matrix, ~] = process_ideal(jiaquan_matrix, TOPSIS_score_function, @min);
    
    TOPSIS_lixiang1 = positive_matrix;
    TOPSIS_lixiang2 = negative_matrix;
end

function [ideal_matrix, indices] = process_ideal(jiaquan_matrix, score_matrix, opt_func)
    indices = zeros(3,1);
    ideal_matrix = zeros(1,12);
    
    for col = 1:3
        [~, indices(col)] = opt_func(score_matrix(:,col));
    end
    
    ranges = {1:4, 5:8, 9:12};
    for i = 1:3
        cols = ranges{i};
        for j = cols
            ideal_matrix(j) = jiaquan_matrix(indices(i), j);
        end
    end
end
