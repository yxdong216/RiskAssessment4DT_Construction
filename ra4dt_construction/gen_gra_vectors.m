function [MABAC_gra1, MABAC_gra2] = gen_gra_vectors(MABAC_jiauqna, MABAC_score1, MABAC_score2, MABAC_score3)
    max_MABAC_score1 = max(MABAC_score1);
    max_MABAC_score2 = max(MABAC_score2);
    max_MABAC_score3 = max(MABAC_score3);
    index1 = find(MABAC_score1 == max_MABAC_score1);
    index2 = find(MABAC_score2 == max_MABAC_score2);
    index3 = find(MABAC_score3 == max_MABAC_score3);

    MABAC_gra1 = zeros(1, 12);
    for j = 1:4
        MABAC_gra1(j) = MABAC_jiauqna(index1, j);
    end
    for j = 5:8
        MABAC_gra1(j) = MABAC_jiauqna(index2, j);
    end
    for j = 9:12
        MABAC_gra1(j) = MABAC_jiauqna(index3, j);
    end

    min_MABAC_score1 = min(MABAC_score1);
    min_MABAC_score2 = min(MABAC_score2);
    min_MABAC_score3 = min(MABAC_score3);
    index4 = find(MABAC_score1 == min_MABAC_score1);
    index5 = find(MABAC_score2 == min_MABAC_score2);
    index6 = find(MABAC_score3 == min_MABAC_score3);

    MABAC_gra2 = zeros(1, 12);
    for j = 1:4
        MABAC_gra2(j) = MABAC_jiauqna(index4, j);
    end
    for j = 5:8
        MABAC_gra2(j) = MABAC_jiauqna(index5, j);
    end
    for j = 9:12
        MABAC_gra2(j) = MABAC_jiauqna(index6, j);
    end
end
