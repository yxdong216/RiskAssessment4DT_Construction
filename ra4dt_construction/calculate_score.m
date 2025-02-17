function TOPSIS_score_function = calculate_score(jiaquan_matrix)
    TOPSIS_score_function = zeros(size(jiaquan_matrix,1), 3);
    TOPSIS_score_function(:,1) = 0.5*(jiaquan_matrix(:,1)+jiaquan_matrix(:,2)-jiaquan_matrix(:,3)-jiaquan_matrix(:,4));
    TOPSIS_score_function(:,2) = 0.5*(jiaquan_matrix(:,5)+jiaquan_matrix(:,6)-jiaquan_matrix(:,7)-jiaquan_matrix(:,8));
    TOPSIS_score_function(:,3) = 0.5*(jiaquan_matrix(:,9)+jiaquan_matrix(:,10)-jiaquan_matrix(:,11)-jiaquan_matrix(:,12));
    disp('TOPSIS_score_function：'); disp(TOPSIS_score_function);
end
