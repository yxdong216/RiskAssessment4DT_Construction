function matrix = compute_baa_matrix(zuidayuansu, zuixiaoyuansu, qujianshu)
    matrix = zeros(23);
    for i = 1:23
        for j = 1:23
            A = zuidayuansu(i);
            B = zuixiaoyuansu(j);
            C = qujianshu(i);
            D = qujianshu(j);
            matrix(i,j) = max(1 - max((A - B)/(C + D), 0), 0);
        end
    end
end
