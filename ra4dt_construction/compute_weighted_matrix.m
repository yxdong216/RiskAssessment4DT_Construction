function jiaquan_matrix = compute_weighted_matrix(zhuanjiajuji_matrix, risk_fengxianzonghe)
    [nRows, nCols] = size(zhuanjiajuji_matrix);
    jiaquan_matrix = zeros(nRows, nCols);
    
    for i = 1:nRows
        for j = 1:nCols
            if j == 1 || j == 2
                jiaquan_matrix(i,j) = 1 - (1 - zhuanjiajuji_matrix(i,j))^risk_fengxianzonghe(1);
            elseif j == 3 || j == 4
                jiaquan_matrix(i,j) = zhuanjiajuji_matrix(i,j)^risk_fengxianzonghe(1);
            elseif j == 5 || j == 6
                jiaquan_matrix(i,j) = 1 - (1 - zhuanjiajuji_matrix(i,j))^risk_fengxianzonghe(2);
            elseif j == 7 || j == 8
                jiaquan_matrix(i,j) = zhuanjiajuji_matrix(i,j)^risk_fengxianzonghe(2);
            elseif j == 9 || j == 10
                jiaquan_matrix(i,j) = 1 - (1 - zhuanjiajuji_matrix(i,j))^risk_fengxianzonghe(3);
            elseif j == 11 || j == 12
                jiaquan_matrix(i,j) = zhuanjiajuji_matrix(i,j)^risk_fengxianzonghe(3);
            end
        end
    end
end
