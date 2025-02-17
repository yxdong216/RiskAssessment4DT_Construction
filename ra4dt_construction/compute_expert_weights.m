function zhuanjia_zonghe = compute_expert_weights(ivifn_matrix)
    num_experts = 6;
    [nRows, nColsTotal] = size(ivifn_matrix);
    num_columns = nColsTotal / num_experts;
    
    average_ivifn = zeros(nRows, num_columns);
    for i = 1:nRows
        for j = 1:num_columns
            sum_val = 0;
            for k = 0:num_experts-1
                sum_val = sum_val + ivifn_matrix(i, j + k*num_columns);
            end
            average_ivifn(i,j) = sum_val / num_experts;
        end
    end
    
    distance_norm = zeros(1, num_experts);
    for k = 0:num_experts-1
        expert_data = ivifn_matrix(:, k*num_columns+1 : (k+1)*num_columns);
        distance_norm(k+1) = norm(expert_data - average_ivifn, 2);
    end
    
    normalized_norm = distance_norm(1:5) / sum(distance_norm(1:5));
    adjusted_norm = 1 - normalized_norm;
    normalized_normresult = adjusted_norm / sum(adjusted_norm);
    
    zhuanjia_zhuguan = [0.25, 0.15, 0.1, 0.2, 0.3];
    product_keguan = zhuanjia_zhuguan .* normalized_normresult;
    zhuanjia_zonghe = product_keguan / sum(product_keguan);
end
