function [ranks, sorted_data] = compute_ranking(data)
    [sorted_data, index] = sort(data, 'descend');
    ranks = zeros(size(data));
    current_rank = 1;
    
    for i = 1:length(sorted_data)
        if i > 1 && sorted_data(i) ~= sorted_data(i-1)
            current_rank = i;
        end
        ranks(index(i)) = current_rank;
    end
end
