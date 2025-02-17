function [MABAC_score, MABAC_score1, MABAC_score2, MABAC_score3] = calc_scores(MABAC_jiauqna)
    MABAC_score1 = 0.5 * (MABAC_jiauqna(:, 1) + MABAC_jiauqna(:, 2) - MABAC_jiauqna(:, 3) - MABAC_jiauqna(:, 4));
    MABAC_score2 = 0.5 * (MABAC_jiauqna(:, 5) + MABAC_jiauqna(:, 6) - MABAC_jiauqna(:, 7) - MABAC_jiauqna(:, 8));
    MABAC_score3 = 0.5 * (MABAC_jiauqna(:, 9) + MABAC_jiauqna(:, 10) - MABAC_jiauqna(:, 11) - MABAC_jiauqna(:, 12));

    MABAC_score = NaN(23, 9);
    MABAC_score(:, 1) = MABAC_score1;
    MABAC_score(:, 5) = MABAC_score2;
    MABAC_score(:, 9) = MABAC_score3;
    disp('Score矩阵计算完成');
end
