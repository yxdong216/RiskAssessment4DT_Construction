function [MABAC_d1, MABAC_d2, MABAC_d3] = compute_distance_matrices(MABAC_jiauqna, MABAC_BAA_vector)
    reference_values7 = MABAC_BAA_vector(1:4); 
    MABAC_d1 = compute_single_distance(MABAC_jiauqna(:,1:4), reference_values7);
    
    reference_values8 = MABAC_BAA_vector(5:8);
    MABAC_d2 = compute_single_distance(MABAC_jiauqna(:,5:8), reference_values8);
    
    reference_values9 = MABAC_BAA_vector(9:12);
    MABAC_d3 = compute_single_distance(MABAC_jiauqna(:,9:12), reference_values9);
end

function distance_vector = compute_single_distance(data_slice, ref_values)
    distance_vector = zeros(size(data_slice,1),1);
    for i = 1:size(data_slice,1)
        current = data_slice(i,:);
        distance = sum((current - ref_values).^2);
        left_diff = sum(current([1 2]) - current([3 4]));
        ref_diff = sum(ref_values([1 2]) - ref_values([3 4]));
        distance_vector(i) = 0.5*sqrt(distance)*sign(left_diff - ref_diff);
    end
end
