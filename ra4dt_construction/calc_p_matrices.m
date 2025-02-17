function [MABAC_p_max, MABAC_p_min, MABAC_row_means1, MABAC_row_means2] = calc_p_matrices(...
    MABAC_max_distance, MABAC_min_distance, max_max_MABAC, min_max_MABAC, max_min_MABAC, min_min_MABAC)
    MABAC_p_max = (min_max_MABAC + 0.5 * max_max_MABAC) ./ (MABAC_max_distance + 0.5 * max_max_MABAC);
    MABAC_row_means1 = mean(MABAC_p_max,2);
    
    MABAC_p_min = (min_min_MABAC + 0.5 * max_min_MABAC) ./ (MABAC_p_max + 0.5 * max_min_MABAC);
    MABAC_row_means2 = mean(MABAC_p_min,2);
end
