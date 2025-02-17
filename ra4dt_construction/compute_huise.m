function TOPSIS_huise = compute_huise(TOPSIS_tihe, TOPSIS_tihefu)
    TOPSIS_huise = TOPSIS_tihe ./ (TOPSIS_tihe + TOPSIS_tihefu); 
end
