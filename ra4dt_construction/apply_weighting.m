function MABAC_jiauqna = apply_weighting(MABAC_zhuanjiajuhe)
    [m, n] = size(MABAC_zhuanjiajuhe);
    MABAC_jiauqna = zeros(m, n);
    
    MABAC_jiauqna(:, 1:2) = 1 - (1 - MABAC_zhuanjiajuhe(:, 1:2)).^0.412;
    MABAC_jiauqna(:, 3:4) = MABAC_zhuanjiajuhe(:, 3:4).^0.412;
    MABAC_jiauqna(:, 5:6) = 1 - (1 - MABAC_zhuanjiajuhe(:, 5:6)).^0.237;
    MABAC_jiauqna(:, 7:8) = MABAC_zhuanjiajuhe(:, 7:8).^0.237;
    MABAC_jiauqna(:, 9:10) = 1 - (1 - MABAC_zhuanjiajuhe(:, 9:10)).^0.351;
    MABAC_jiauqna(:, 11:12) = MABAC_zhuanjiajuhe(:, 11:12).^0.351;
    
end
