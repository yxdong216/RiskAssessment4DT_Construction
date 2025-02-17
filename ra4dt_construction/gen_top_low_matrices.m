function [MABAC_top, MABAC_low] = gen_top_low_matrices(MABAC_jiauqna, MABAC_score)
    MABAC_top = zeros(23, 4);
    for i = 1:23
        for j = 1:4
            [~, max_idx] = max(MABAC_score(i, :));
            adjusted_column = max_idx - 1 + j;
            MABAC_top(i, j) = MABAC_jiauqna(i, adjusted_column);
        end
    end
    disp('MABAC_top：'); disp(MABAC_top);

    MABAC_low = zeros(23, 4);
    for i = 1:23
        for j = 1:4
            [~, min_idx] = min(MABAC_score(i, :));
            adjusted_column = min_idx - 1 + j;
            MABAC_low(i, j) = MABAC_jiauqna(i, adjusted_column);
        end
    end
    disp('MABAC_min：'); disp(MABAC_low);
end
