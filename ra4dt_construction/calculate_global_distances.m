function [TOPSIS_zhengquan, TOPSIS_fuquan] = calculate_global_distances(jiaquan_matrix, TOPSIS_lixiang1, TOPSIS_lixiang2)
    TOPSIS_zhengquan = 0.5*sqrt(sum((jiaquan_matrix - TOPSIS_lixiang1).^2, 2));
    TOPSIS_fuquan = 0.5*sqrt(sum((jiaquan_matrix - TOPSIS_lixiang2).^2, 2));
    disp('TOPSIS_zhengquan：'); disp(TOPSIS_zhengquan);
    disp('TOPSIS_fuquan：'); disp(TOPSIS_fuquan);
end
