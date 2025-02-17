function [MABAC_max_distance, MABAC_min_distance] = calc_distances(MABAC_jiauqna, MABAC_top, MABAC_low)
    
    MABAC_max_distance = zeros(23, 3);
    for i = 1:23
        MABAC_max_distance(i, 1) = sqrt(sum((MABAC_jiauqna(i,1:4)-MABAC_top(i,1:4)).^2));
        MABAC_max_distance(i, 2) = sqrt(sum((MABAC_jiauqna(i,5:8)-MABAC_top(i,1:4)).^2));
        MABAC_max_distance(i, 3) = sqrt(sum((MABAC_jiauqna(i,9:12)-MABAC_top(i,1:4)).^2));
    end
    
    MABAC_min_distance = zeros(23, 3);
    for i = 1:23
        MABAC_min_distance(i, 1) = sqrt(sum((MABAC_jiauqna(i,1:4)-MABAC_low(i,1:4)).^2));
        MABAC_min_distance(i, 2) = sqrt(sum((MABAC_jiauqna(i,5:8)-MABAC_low(i,1:4)).^2));
        MABAC_min_distance(i, 3) = sqrt(sum((MABAC_jiauqna(i,9:12)-MABAC_low(i,1:4)).^2));
    end
end
