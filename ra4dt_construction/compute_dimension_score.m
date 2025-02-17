function scores = compute_dimension_score(jiaquan_block, reference_values)
    nRows = size(jiaquan_block, 1);
    scores = zeros(nRows, 1);
    
    for i = 1:nRows
        current_values = jiaquan_block(i, :);
        left_side = sum(current_values([1,2])) - sum(current_values([3,4]));
        reference_sum = sum(reference_values([1,2])) - sum(reference_values([3,4]));
        distance = sum((current_values - reference_values).^2);
        
        if left_side >= reference_sum
            scores(i) = 0.5 * sqrt(distance);
        else
            scores(i) = -0.5 * sqrt(distance);
        end
    end
end
