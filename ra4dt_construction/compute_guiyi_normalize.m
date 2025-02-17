function [guiyi_means, guiyichuli] = compute_guiyi_normalize(huise_matrix)
    guiyi_means = mean(huise_matrix, 2);
    guiyichuli = guiyi_means ./ max(guiyi_means);
end
