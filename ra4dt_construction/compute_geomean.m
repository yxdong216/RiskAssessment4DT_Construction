function TOPSIS_geomean = compute_geomean(TOPSIS_zhengquan, TOPSIS_fuquan)
    TOPSIS_geomean = TOPSIS_zhengquan ./ (TOPSIS_zhengquan + TOPSIS_fuquan);
end
