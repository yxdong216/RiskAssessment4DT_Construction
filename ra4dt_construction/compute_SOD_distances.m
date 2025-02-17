function [juliS, juliO, juliD] = compute_SOD_distances(zhuanjiajuji_matrix, border_vector)
    juliS = ComputeBlockDistance(zhuanjiajuji_matrix(:,1:4), border_vector(1:4));
    juliO = ComputeBlockDistance(zhuanjiajuji_matrix(:,5:8), border_vector(5:8));
    juliD = ComputeBlockDistance(zhuanjiajuji_matrix(:,9:12), border_vector(9:12));
end

function distances = ComputeBlockDistance(block_data, reference)
    nRows = size(block_data,1);
    distances = zeros(nRows,1);
    reference_sum = sum(reference([1,2])) - sum(reference([3,4]));
    for i = 1:nRows
        current = block_data(i,:);
        left_side = sum(current([1,2])) - sum(current([3,4]));
        distance_val = sum((current - reference).^2);
        if left_side >= reference_sum
            distances(i) = 0.5 * sqrt(distance_val);
        else
            distances(i) = -0.5 * sqrt(distance_val);
        end
    end
end
