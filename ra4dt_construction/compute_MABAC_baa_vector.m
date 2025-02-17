function MABAC_BAA_vector = compute_MABAC_baa_vector(MABAC_jiauqna, FMgeshu)
    MABAC_BAA_vector = zeros(1, 12);
    
    for j = 1:12
        if ismember(j, [1,2,5,6,9,10])
            MABAC_BAA_vector(j) = prod(MABAC_jiauqna(:,j).^FMgeshu);
        else
            MABAC_BAA_vector(j) = 1 - prod((1-MABAC_jiauqna(:,j)).^FMgeshu);
        end
    end
end
