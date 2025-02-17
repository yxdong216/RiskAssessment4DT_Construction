function [TOPSIS_zhengjie, TOPSIS_fujie] = calculate_block_distances(jiaquan_matrix, TOPSIS_lixiang1, TOPSIS_lixiang2)
    block_ranges = {1:4, 5:8, 9:12};
    [TOPSIS_zhengjie] = process_block(jiaquan_matrix, TOPSIS_lixiang1, block_ranges);
    [TOPSIS_fujie] = process_block(jiaquan_matrix, TOPSIS_lixiang2, block_ranges);
    disp('TOPSIS正距离：'); disp(TOPSIS_zhengjie);
    disp('TOPSIS负距离：'); disp(TOPSIS_fujie);
end

function block_dist = process_block(matrix, ideal, block_ranges)
    block_dist = zeros(size(matrix,1), 3);
    for i = 1:3
        cols = block_ranges{i};
        for row = 1:size(matrix,1)
            block_dist(row,i) = 0.5*sqrt(sum((matrix(row,cols) - ideal(cols)).^2));
        end
    end
end
