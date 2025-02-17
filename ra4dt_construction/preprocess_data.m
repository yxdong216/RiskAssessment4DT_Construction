function [new_ivifn, reordered_matrix] = preprocess_data(ivifn_matrix, cols_to_remove, groups)
    new_ivifn = ivifn_matrix(:, ~ismember(1:size(ivifn_matrix, 2), cols_to_remove));
    new_order = [];
    for i = 1:length(groups)
        new_order = [new_order, groups{i}];
    end
    reordered_matrix = new_ivifn(:, new_order);
end
