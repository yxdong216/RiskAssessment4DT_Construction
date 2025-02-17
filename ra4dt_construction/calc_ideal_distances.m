function [MABAC_zheng, MABAC_fu, MABAC_d1, MABAC_d2] = calc_ideal_distances(MABAC_jiauqna, MABAC_gra1, MABAC_gra2)
    MABAC_zheng = zeros(23,3);
    for i = 1:23
        MABAC_zheng(i,1) = sqrt(sum((MABAC_jiauqna(i,1:4)-MABAC_gra1(1:4)).^2));
        MABAC_zheng(i,2) = sqrt(sum((MABAC_jiauqna(i,5:8)-MABAC_gra1(5:8)).^2));
        MABAC_zheng(i,3) = sqrt(sum((MABAC_jiauqna(i,9:12)-MABAC_gra1(9:12)).^2));
    end
    
    MABAC_fu = zeros(23,3);
    for i = 1:23
        MABAC_fu(i,1) = sqrt(sum((MABAC_jiauqna(i,1:4)-MABAC_gra2(1:4)).^2));
        MABAC_fu(i,2) = sqrt(sum((MABAC_jiauqna(i,5:8)-MABAC_gra2(5:8)).^2));
        MABAC_fu(i,3) = sqrt(sum((MABAC_jiauqna(i,9:12)-MABAC_gra2(9:12)).^2));
    end
    
    MABAC_d1 = sqrt(sum(MABAC_zheng.^2,2));
    MABAC_d2 = sqrt(sum(MABAC_fu.^2,2));
end
