function huise_matrix = compute_huiseguanlian(distance_matrix, max_val, min_val)
    huise_matrix = (min_val + 0.5 * max_val) ./ (distance_matrix + 0.5 * max_val);
end
