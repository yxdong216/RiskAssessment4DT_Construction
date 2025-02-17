function MABAC_zhuanjiajuhe = compute_expert_aggregation(reordered_matrix)
    [file, path] = uigetfile('*.xlsx', '请选择一个位于A1:E1的 A1, A2, A3, A4, A5 值的 Excel 文件');
    
    if file == 0
        error('未选择文件，请选择一个有效的 Excel 文件。');
    end
    
    A_values = xlsread(fullfile(path, file), 'A1:E1');
    
    if numel(A_values) ~= 5
        error('Excel 文件中的值无效，应该是 A1, A2, A3, A4, A5 的 5 个数值。');
    end
    
    A1 = A_values(1);
    A2 = A_values(2);
    A3 = A_values(3);
    A4 = A_values(4);
    A5 = A_values(5);

    [nRows, nCols] = size(reordered_matrix);
    MABAC_zhuanjiajuhe = zeros(nRows, 12);



    for i = 1:nRows
        for j = 1:12
            A = reordered_matrix(i, j); 
            B = reordered_matrix(i, min(j+12, nCols)); 
            C = reordered_matrix(i, min(j+24, nCols)); 
            D = reordered_matrix(i, min(j+36, nCols)); 
            E = reordered_matrix(i, min(j+48, nCols)); 

            if ismember(j, [3,4,7,8,11,12])
                MABAC_zhuanjiajuhe(i, j) = A^A1 * B^A2 * C^A3 * D^A4 * E^A5;
            else
                MABAC_zhuanjiajuhe(i, j) = 1 - ((1-A)^A1*(1-B)^A2*(1-C)^A3*(1-D)^A4*(1-E)^A5);
            end
        end
    end
end
