function zhuanjiajuji_matrix = aggregate_expert_judgments(ivifn_matrix, zhuanjia_zonghe)
    [nRows, nCols] = size(ivifn_matrix);
    zhuanjiajuji_matrix = zeros(nRows, 12);
    for i = 1:nRows
        for j = 1:12
            A = ivifn_matrix(i, j);
            B = ivifn_matrix(i, min(j+12, nCols));
            C = ivifn_matrix(i, min(j+24, nCols));
            D = ivifn_matrix(i, min(j+36, nCols));
            E = ivifn_matrix(i, min(j+48, nCols));
            
            if ismember(j, [3,4,7,8,11,12])
                result = (A^zhuanjia_zonghe(1)) * (B^zhuanjia_zonghe(2)) * ...
                         (C^zhuanjia_zonghe(3)) * (D^zhuanjia_zonghe(4)) * ...
                         (E^zhuanjia_zonghe(5));
            else
                result = 1 - ( (1-A)^zhuanjia_zonghe(1) * (1-B)^zhuanjia_zonghe(2) * ...
                              (1-C)^zhuanjia_zonghe(3) * (1-D)^zhuanjia_zonghe(4) * ...
                              (1-E)^zhuanjia_zonghe(5) );
            end
            zhuanjiajuji_matrix(i,j) = result;
        end
    end
end
