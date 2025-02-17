function ivifn_matrix = create_ivifn_matrix(data)
    ivifn_matrix = [];
    [nRows, nCols] = size(data);
    for i = 1:nRows
        for j = 1:nCols
            term = data{i,j};
            switch term
                case 'EL'
                    lower_bound = [0.10, 0.10];
                    upper_bound = [0.90, 0.90];
                case 'VL'
                    lower_bound = [0.15, 0.20];
                    upper_bound = [0.60, 0.75];
                case 'L'
                    lower_bound = [0.25, 0.35];
                    upper_bound = [0.50, 0.60];
                case 'ML'
                    lower_bound = [0.35, 0.45];
                    upper_bound = [0.40, 0.55];
                case 'M'
                    lower_bound = [0.50, 0.50];
                    upper_bound = [0.50, 0.50];
                case 'MH'
                    lower_bound = [0.45, 0.60];
                    upper_bound = [0.15, 0.25];
                case 'H'
                    lower_bound = [0.60, 0.75];
                    upper_bound = [0.10, 0.20];
                case 'VH'
                    lower_bound = [0.75, 0.85];
                    upper_bound = [0.05, 0.15];
                case 'EH'
                    lower_bound = [0.90, 0.90];
                    upper_bound = [0.10, 0.10];
                case 'EXH'
                    lower_bound = [0.99, 0.99];
                    upper_bound = [0.01, 0.01];
                otherwise
                    error('Unknown term: %s', term); 
            end
            col_idx = (j-1)*4 + 1;
            ivifn_matrix(i, col_idx:col_idx+3) = [lower_bound, upper_bound];
        end
    end
end
