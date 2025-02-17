function TOPSIS_xiangduibi = compute_xiangduibi(TOPSIS_xiangdui, TOPSIS_xiangduifu)
    TOPSIS_xiangduibi = TOPSIS_xiangdui ./ (TOPSIS_xiangdui + TOPSIS_xiangduifu);
end
